/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Javi4
 */
public class ControladorCoche extends HttpServlet {

    Statement coche = null;
    Connection conexion = null;

    public void init(ServletConfig config) throws ServletException {
        try {
            conexion = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
            coche = conexion.createStatement();
        } catch (Exception e) {
            System.out.println("Problemas al conectar con la base de datos");
        }
    }

    public void service(HttpServletRequest peticion, HttpServletResponse respuesta)
            throws ServletException, IOException {

        /* recuperamos los valores que nos manda el cliente */
        String strNombre = peticion.getParameter("NombreCoche");
        int Ganancia = Integer.valueOf(peticion.getParameter("GananciaPotencia"));
        ResultSet resultado;
        if (strNombre.equals("")) {
            respuesta.sendRedirect("ErrorInsercionCircuito.html");
            return;
        }
        try {
            resultado = coche.executeQuery("SELECT DISTINCT * FROM APP.COCHE");
            boolean redirect = false;
            while (resultado.next()) {
                if (resultado.getString("NOMBRE").equals(strNombre)) {
                    redirect = true;
                    break;
                }
            }
            if (redirect) {
                respuesta.sendRedirect("ErrorInsercionCoche.html");
            } else {
                coche.execute("INSERT INTO APP.COCHE (NOMBRE, GANANCIAXCURVA) VALUES( '" + strNombre + "', " + Ganancia + ")");
                /* creaci??n del flujo de salida hacia el cliente */
                ServletOutputStream out = respuesta.getOutputStream();
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<link rel=\"stylesheet\" href=\"./css/style.css\">");
                out.println("<style>\n"
                        + "        table,\n"
                        + "        th,\n"
                        + "        th {\n"
                        + "            border: 1px solid black;\n"
                        + "        }\n"
                        + "    </style>");
                out.println("</head>");
                out.println("<body>");
                out.println("<section class=\"seccion\" id=\"1\">");
                out.println("<h1> Has creado el coche</h1>");
                out.println("<button class=\"myButton\" onclick=\"location.href='index.html'\">Volver al men?? principal</button>");
                out.println("</body>");
                out.println("</section>");
                out.println("</html>");
                respuesta.setContentType("text/html");
            }

        } catch (IOException | SQLException ex) {
            Logger.getLogger(ControladorCoche.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /* leemos todos los registros para crear la estad??stica */
    public void destroy() {
        try {
            conexion.close();
        } catch (SQLException e) {
            System.out.println(e);
            return;
        }
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador Coche</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1> Has creado el coche</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
