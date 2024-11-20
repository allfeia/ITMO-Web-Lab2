package resources;

import java.io.Serial;
import java.io.Serializable;
import java.util.Objects;
import java.util.SplittableRandom;

public class Result implements Serializable {
    @Serial
    private static final long serialVersionUID = 2L;
    private String x;
    private String y;
    private String r;
    private boolean hit;
    private double executionTime;
    private String currentTime;

    public Result(String x, String y, String r, boolean hit, double executionTime, String currentTime) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.hit = hit;
        this.executionTime = executionTime;
        this.currentTime = currentTime;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public String getY() {
        return y;
    }

    public void setY(String y) {
        this.y = y;
    }

    public String getR() {
        return r;
    }

    public void setR(String r) {
        this.r = r;
    }

    public boolean isHit() {
        return hit;
    }

    public void setHit(boolean hit) {
        this.hit = hit;
    }

    public double getTime() {
        return executionTime;
    }

    public void setTime(double time) {
        this.executionTime = time;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public void setCurrentTime(String currentTime) {
        this.currentTime = currentTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return false;
    }

    @Override
    public int hashCode() {
        return Objects.hash(x, y, r);
    }

    @Override
    public String toString() {
        return "Result{" +
                "x='" + x + '\'' +
                ", y='" + y + '\'' +
                ", r='" + r + '\'' +
                ", executionTime=" + executionTime +
                ", currentTime='" + currentTime + '\'' +
                '}';
    }
}

