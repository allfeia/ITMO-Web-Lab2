import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import resources.*;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        List<Result> results = new ArrayList<>();
        getServletContext().setAttribute("results", results);
    }

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            StringBuilder json = new StringBuilder();
            String line;
            //Считываем тело запроса
            try (BufferedReader reader = request.getReader()) {
                while ((line = reader.readLine()) != null) {
                    json.append(line);
                }
            }
            JSONObject jsonObject = new JSONObject(json.toString());

            double xParam = jsonObject.getDouble("x");
            double yParam = jsonObject.getDouble("y");
            double rParam = jsonObject.getDouble("r");

            if (!Double.isNaN(xParam) && !Double.isNaN(yParam) && !Double.isNaN(rParam)) {
                request.setAttribute("x", xParam);
                request.setAttribute("y", yParam);
                request.setAttribute("r", rParam);
                // Перенаправление на сервлет-обработчик, если параметры корректны
                request.getRequestDispatcher("/checkArea").forward(request, response);
            } else {
                // Перенаправление на jsp страницу, если параметры некорректны
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }catch (Exception e) {
            // Перенаправление на jsp страницу, если параметры некорректны
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
