
import com.google.gson.Gson;
import resources.Result;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/checkArea")
public class AreaCheckServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            long startTime = System.nanoTime();

            //Извлечение значений x, y, r из JSON-объекта
            double x = (double) request.getAttribute("x");
            double y = (double) request.getAttribute("y");
            double r = (double) request.getAttribute("r");

            boolean isInArea = checkArea(x, y, r);

            ServletContext context = getServletContext();
            List<Result> results = (ArrayList<Result>) context.getAttribute("results");
            if (results == null) {
                results = new ArrayList<>();
                context.setAttribute("results", results);
            }
            Result result = new Result(String.valueOf(x),
                    String.valueOf(y), String.valueOf(r), isInArea, System.nanoTime() - startTime, LocalTime.now().toString());
            results.add(result);

            //Ответ в формате JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new Gson().toJson(results));
            System.out.println(new Gson().toJson(results));
        }catch (Exception e){
            Result result = new Result(e.getMessage(), "error", "error", false, 1, LocalTime.now().toString());

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new Gson().toJson(result));
        }

    }

    private boolean checkArea(double x, double y, double r) {
        if (x > 0 && y < 0) return false;
        else if (x >= 0 && y >= 0) return y <= r - 2 * x;
        else if (x <= 0 && y >= 0) return y <= r && x >= -r/2;
        else return x * x + y * y <= r * r;
    }

}
