/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.47
 * Generated at: 2020-02-13 03:15:45 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class mainPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write(" \r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("  \r\n");
      out.write("    \r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/* ======= Carousel css ======= */\r\n");
      out.write("  \r\n");
      out.write("\t.carousel {\r\n");
      out.write("\t    border: solid 2px black;\r\n");
      out.write("\t    margin-bottom: 50px;\r\n");
      out.write("\t    width: 85%;\r\n");
      out.write("\t    margin : 43px auto 50px auto;\r\n");
      out.write("\t}\r\n");
      out.write("   \r\n");
      out.write("   .carousel-inner img {\r\n");
      out.write("\t\twidth: 100%; /* Set width to 100% */\r\n");
      out.write("\t\theight: auto;\r\n");
      out.write("\t\tmargin: auto;\r\n");
      out.write("\t\tmin-height:200px;\r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("\t/* ul tag*/\r\n");
      out.write("\t.carousel-indicators {\r\n");
      out.write("\t \t  bottom:-75px;\r\n");
      out.write("\t }\r\n");
      out.write(" \r\n");
      out.write("\t.carousel-indicators li {\r\n");
      out.write("\t\twidth: 30px;\t\t\t\t/* active가 아닌 li 가로 크기 */\r\n");
      out.write("\t\theight: 30px;\t\t\t\t/* active가 아닌 li 세로 크기 */\r\n");
      out.write("\t\tmargin: 0px 10px 7px 10px;\r\n");
      out.write("\t\tborder-radius: 100%;\r\n");
      out.write("\t }\r\n");
      out.write("\t \r\n");
      out.write("\t \r\n");
      out.write("\t .carousel-indicators li.pacman1{\r\n");
      out.write("\t\twidth:43px;\t\t\t\t/* active인 li 가로 크기(팩맨) */\r\n");
      out.write("\t\theight:43px;\t\t\t/* active인 li 세로 크기(팩맨) */\r\n");
      out.write("\t\tmargin:0px 10px 0px 10px;\r\n");
      out.write("\t\tbackground-image: url(\"./images/pacman1.png\");\r\n");
      out.write("\t\tbackground-size:100%;\r\n");
      out.write("\t}  \r\n");
      out.write("\t\r\n");
      out.write("\t.carousel-indicators li.active{\r\n");
      out.write("\t\twidth:45px;\t\t\t\t/* active인 li 가로 크기(팩맨) */\r\n");
      out.write("\t\theight:45px;\t\t\t/* active인 li 세로 크기(팩맨) */\r\n");
      out.write("\t\tmargin:0px 10px 0px 10px;\r\n");
      out.write("\t\tbackground-image: url(\"./images/pacman2.png\");\r\n");
      out.write("\t\tbackground-size:100%;\r\n");
      out.write("\t\t\r\n");
      out.write("\t}  \r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("/* ======= Container css ======= */\r\n");
      out.write("   \r\n");
      out.write("   #contents {\r\n");
      out.write("   \t\tpadding-top: 40px;\t\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   .container {\r\n");
      out.write("    \tmargin-bottom: 50px;\r\n");
      out.write("    \twidth: 90.45%;\r\n");
      out.write("    \theight: auto;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   .prodImg {\r\n");
      out.write("   \t\twidth: auto;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("    div.price li {\r\n");
      out.write(" \t\tlist-style-type: none;\r\n");
      out.write("    }\r\n");
      out.write("  \r\n");
      out.write("\tdiv.price ul {\r\n");
      out.write("\t \tpadding: 10px;\r\n");
      out.write("\t }\r\n");
      out.write("\t  \r\n");
      out.write("\t a.listTitle {\r\n");
      out.write("\t  \tfont-size: 20px;\r\n");
      out.write("\t  \tfont-weight: bold;\r\n");
      out.write("\t  \tcolor: black;\r\n");
      out.write("\t  }\r\n");
      out.write("  \r\n");
      out.write("\t.listTitle{\r\n");
      out.write("\t\toverflow: hidden;\r\n");
      out.write("\t\ttext-overflow: ellipsis;\r\n");
      out.write("\t\twhite-space: nowrap;\r\n");
      out.write("\t\tdisplay: block;\r\n");
      out.write("\t}\r\n");
      out.write("  \r\n");
      out.write("\tspan.currentPrice {\r\n");
      out.write("\t\tfont-weight: bold;\r\n");
      out.write("\t}\r\n");
      out.write("  \r\n");
      out.write("\tspan.discPrice {\r\n");
      out.write("\t\tfont-weight: bold;\r\n");
      out.write("\t\tfont-size: 18px;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\timg.bestBar {\r\n");
      out.write("\t\tmargin-bottom: 30px; \r\n");
      out.write("\t\twidth: 95.8%;\r\n");
      out.write("\t\tposition: relative;\r\n");
      out.write("\t\tleft: 2%;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write(" \r\n");
      out.write("\t@media (min-width: 768px) {\r\n");
      out.write(" \r\n");
      out.write(" \t\t.col-sm-4{\r\n");
      out.write("\t\t  \tborder: solid 2px black; \r\n");
      out.write("\t\t  \tborder-top: solid 6px black;\r\n");
      out.write("\t\t  \tpadding: 0px;\r\n");
      out.write("\t\t  \tmargin: 1%;\r\n");
      out.write("\t\t  \twidth: 30%;\r\n");
      out.write("\t\t  \ttext-align: left;\r\n");
      out.write("\t\t    position: relative;\r\n");
      out.write("\t\t  \tleft: 2%; \r\n");
      out.write(" \t\t }\r\n");
      out.write(" \t}\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write("\t@media (max-width: 768px) {\r\n");
      out.write("   \r\n");
      out.write("    \t.col-sm-4{\r\n");
      out.write("\t    \tborder: solid 2px black; \r\n");
      out.write("\t\t  \tborder-top: solid 4px black;\r\n");
      out.write("\t\t  \tpadding: 0px;\r\n");
      out.write("\t\t  \tmargin: 1%;\r\n");
      out.write("\t\t  \ttext-align: left;\r\n");
      out.write("    \t}\r\n");
      out.write("  \t}\r\n");
      out.write("   \r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<script src=\"//code.jquery.com/jquery-3.3.1.min.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
      out.write("\t$( document ).ready( function() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t});\r\n");
      out.write("\t  \r\n");
      out.write("</script>\r\n");
      out.write("    \r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<!-- ================================Carousel====================================== -->\r\n");
      out.write("\t\r\n");
      out.write("<div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\">\r\n");
      out.write("    <!-- Indicators -->\r\n");
      out.write("    <ol class=\"carousel-indicators\">\r\n");
      out.write("\t    <li data-target=\"#myCarousel\" data-slide-to=\"0\" class=\"active pacman1\"></li>\r\n");
      out.write("\t    <li data-target=\"#myCarousel\" data-slide-to=\"1\" class=\"active pacman1\"></li>\r\n");
      out.write("\t    <li data-target=\"#myCarousel\" data-slide-to=\"2\" class=\"active pacman1\"></li>\r\n");
      out.write("\t    <li data-target=\"#myCarousel\" data-slide-to=\"3\" class=\"active pacman1\"></li>\r\n");
      out.write("    </ol>\r\n");
      out.write("\r\n");
      out.write("    <!-- Wrapper for slides -->\r\n");
      out.write("    <div class=\"carousel-inner\" role=\"listbox\">\r\n");
      out.write("    \t<div class=\"item active\">\r\n");
      out.write("        \t<img src=\"images/visual1.jpg\" alt=\"Image\">\r\n");
      out.write("      \t</div>\r\n");
      out.write("\r\n");
      out.write("\t    <div class=\"item\">\r\n");
      out.write("\t        <img src=\"images/visual2.jpg\" alt=\"Image\">\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t      \r\n");
      out.write("\t    <div class=\"item\">\r\n");
      out.write("\t        <img src=\"images/visual3.jpg\" alt=\"Image\">\r\n");
      out.write("\t    </div>\r\n");
      out.write("\t      \r\n");
      out.write("\t    <div class=\"item\">\r\n");
      out.write("\t        <img src=\"images/visual4.jpg\" alt=\"Image\">\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<!-- =========================================Contents================================ -->\r\n");
      out.write("\r\n");
      out.write("<div id=\"contents\"> \r\n");
      out.write("<div class=\"container text-center\">    \r\n");
      out.write("  <img src=\"http://earpearp.com/img/title_hardbest.png\" class=\"img-responsive bestBar\"/>\r\n");
      out.write("  <div class=\"row\">\r\n");
      out.write("  \t<div class=\"col-sm-4\">\r\n");
      out.write("  \t  <a href=\"/Semi/product/detail.sa?cateno=1&prodcode=123-005\">\r\n");
      out.write("  \t  <img src=\"http://earpearp.com/web/product/big/201910/af42ad55f65d299104a9252c86973a5a.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a>\r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/prodcut/detail.sa?cateno=1&prodcode=123-005\" class=\"listTitle\">Eyes bear-yellow</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>19,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">9,800WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\"> \r\n");
      out.write("      <a href=\"/Semi/product/detail.sa?cateno=1&prodcode=123-049\">\r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201910/092b6b07f4f73afbc62826fc248978ef.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a>\r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/product/detail.sa?cateno=1&prodcode=123-049\" class=\"listTitle\">dancing bear-blue</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>19,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">9,800WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>  \r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("      <a href=\"/Semi/product/detail.sa?cateno=1&prodcode=123-003\">\r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201910/96f38ad3ba951551baae73bcb6aca75d.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a>\r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/product/detail.sa?cateno=1&prodcode=123-003\" class=\"listTitle\">True luv-pink</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>19,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">9,800WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <br/>\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("      <a href=\"/Semi/product/detail.sa?cateno=1&prodcode=123-032\">\r\n");
      out.write("      <img src=\"http://localhost:9090/Semi/imgProd/32_hard_Bear%20flower%20garden-purple.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a>  \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/product/detail.sa?cateno=1&prodcode=123-032\" class=\"listTitle\">Bear flower garden-purple</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>19,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">9,800WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\"> \r\n");
      out.write("      <a href=\"/Semi/product/detail.sa?cateno=1&prodcode=123-028\">\r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201910/0ad4092920be23c8ef05527cee088f25.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a>  \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/product/detail.sa?cateno=1&prodcode=123-028\" class=\"listTitle\">Animal friends-navy</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>19,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">9,800WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>  \r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("      <a href=\"/Semi/product/detail.sa?cateno=1&prodcode=123-035\">\r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201910/05eb30958d451353262b78bbbd31ef5e.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a>  \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/product/detail.sa?cateno=1&prodcode=123-035\" class=\"listTitle\">Squirrel Acorns-yellow</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>19,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">9,800WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</div><br>\r\n");
      out.write("\r\n");
      out.write("<div class=\"container text-center\">    \r\n");
      out.write("  <img src=\"http://earpearp.com/img/title_jellybest.png\" class=\"img-responsive bestBar\"/>\r\n");
      out.write("    <div class=\"row\">\r\n");
      out.write("  \t<div class=\"col-sm-4\">\r\n");
      out.write("  \t  <a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-115\">\r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201910/4256c65ed5255141a20c268576e90b88.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a> \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-115\" class=\"listTitle\">Picnic bear(젤리)</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>17,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">7,900WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\"> \r\n");
      out.write("      <a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-110\">\r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201910/2a065c3b442bebef2ae4e8249fb7555a.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a> \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-110\" class=\"listTitle\">dancing bear(젤리)</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>17,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">7,900WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>  \r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("      <a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-117\">\r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201910/aa72669896a78d28977cf823894ed2b7.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a>  \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-117\" class=\"listTitle\">Bear friends(젤리)</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>17,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">7,900WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("      <a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-130\">\r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201910/994e6dc302d2911784fc00226f399001.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a>  \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-130\" class=\"listTitle\">Dot cherry big bear(젤리) </a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>17,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">7,900WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\"> \r\n");
      out.write("      <a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-022\">\r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201910/205947c6192776a03cc205e5813d736b.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a>  \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-022\" class=\"listTitle\">Rose squirrel(젤리)</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>17,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">7,900WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div> \r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("      <a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-103\">\r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201910/fe2b64d120f14941a68b58f7b4593d7e.jpg\" class=\"prodImg\" style=\"width:100%\"/>\r\n");
      out.write("      </a>  \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a href=\"/Semi/product/detail.sa?cateno=3&prodcode=123-103\" class=\"listTitle\">Eyes bear(젤리)</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>17,000WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">7,900WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</div><br>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container text-center\">    \r\n");
      out.write("  <img src=\"/Semi/images/title_comingsoon.png\" class=\"img-responsive bestBar\" />\r\n");
      out.write("    <div class=\"row\">\r\n");
      out.write("  \t<div class=\"col-sm-4\">\r\n");
      out.write("  \t\r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201911/bb6f79e7ac9263e3a167bc477852b11c.jpg\" class=\"prodImg\" style=\"width:100%\" alt=\"hard_CheeryBigBearYellow\"/>\r\n");
      out.write("     \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a class=\"listTitle\">Dancing bear-white(떡메모지)</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>3,500WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">2,100WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\"> \r\n");
      out.write("    \r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201911/73b08d2310fd091aeec981ad3b877d60.jpg\" class=\"prodImg\" style=\"width:100%\" alt=\"hard_CheeryBigBearYellow\"/>\r\n");
      out.write("    \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a class=\"listTitle\">Dancing bear-purple(떡메모지)</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>3,500WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">2,100WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>  \r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("    \r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201911/e6865ac766811c4dcd005b29fb9a99a6.jpg\" class=\"prodImg\" style=\"width:100%\" alt=\"hard_CheeryBigBearYellow\"/>\r\n");
      out.write("      \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a class=\"listTitle\">Rose squirrel(떡메모지)</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>3,500WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">2,100WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <br/>\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("    \r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201911/10766813e4f5dc52f9b024fb5f34d951.jpg\" class=\"prodImg\" style=\"width:100%\" alt=\"hard_CheeryBigBearYellow\"/>\r\n");
      out.write("      \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a class=\"listTitle\">Cherry big bear(떡메모지)</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>3,500WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">2,100WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\"> \r\n");
      out.write("    \r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201911/459244113d40effdb8d716662a4db558.jpg\" class=\"prodImg\" style=\"width:100%\" alt=\"hard_CheeryBigBearYellow\"/>\r\n");
      out.write("     \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a class=\"listTitle\">True luv(떡메모지)</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일 11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>3,500WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">2,100WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("    \r\n");
      out.write("      <img src=\"http://earpearp.com/web/product/big/201911/3a19013c656ae48f52537c68f9adb720.jpg\" class=\"prodImg\" style=\"width:100%\" alt=\"hard_CheeryBigBearYellow\"/>\r\n");
      out.write("    \r\n");
      out.write("      <div class=\"price\">\r\n");
      out.write("      \t<ul>\r\n");
      out.write("      \t\t<li><a class=\"listTitle\">Grid kids bear-orange(떡메모지)</a></li>\r\n");
      out.write("      \t\t<li><span>기간한정세일11.15-12.31</span></li>\r\n");
      out.write("      \t\t<li><span class=\"currentPrice\"><del>3,500WON</del></span></li>\r\n");
      out.write("      \t\t<li><span class=\"discPrice\">2,100WON</span></li>\r\n");
      out.write("      \t</ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("  \r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
