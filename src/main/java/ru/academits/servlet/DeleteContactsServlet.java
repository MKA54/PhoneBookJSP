package ru.academits.servlet;

import ru.academits.PhoneBook;
import ru.academits.service.ContactService;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.stream.Collectors;

public class DeleteContactsServlet extends HttpServlet {
    private final ContactService contactService = PhoneBook.contactService;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String contactParams = req.getReader().lines().collect(Collectors.joining(System.lineSeparator()));

        System.out.println("Servlet open");

        resp.sendRedirect("/phonebook");
    }
}