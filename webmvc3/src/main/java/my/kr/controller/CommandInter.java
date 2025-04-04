package my.kr.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface CommandInter {
	String showData(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
