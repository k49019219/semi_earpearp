/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.47
 * Generated at: 2020-03-21 13:34:01 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class productList_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1576647304000L));
    _jspx_dependants.put("/WEB-INF/lib/taglibs-standard-jstlel-1.2.5.jar", Long.valueOf(1576647304000L));
    _jspx_dependants.put("jar:file:/Volumes/Samsung_T3/PROGRAMMING/세미프로젝트/Semi/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Semi/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1425946270000L));
    _jspx_dependants.put("jar:file:/Volumes/Samsung_T3/PROGRAMMING/세미프로젝트/Semi/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Semi/WEB-INF/lib/taglibs-standard-jstlel-1.2.5.jar!/META-INF/fmt-1_0.tld", Long.valueOf(1425946268000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fchoose;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fotherwise;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

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
    _005fjspx_005ftagPool_005fc_005fchoose = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fotherwise = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fchoose.release();
    _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.release();
    _005fjspx_005ftagPool_005fc_005fotherwise.release();
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../header.jsp", out, false);
      out.write("\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write("\theader {\r\n");
      out.write("\t\r\n");
      out.write("\t\tmargin-bottom: 0px;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t#banner {\r\n");
      out.write("\t\r\n");
      out.write("\t\tmargin-bottom: 20px;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t#bannerh2 {\r\n");
      out.write("\t\r\n");
      out.write("\t\tfont-size : 20px;\r\n");
      out.write("\t\tfont-weight: 900; \r\n");
      out.write("\t\tcolor:#00a0e2;\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#bannerh2.hard::after {\r\n");
      out.write("\t\r\n");
      out.write("\t\tmargin : 0 46.27%;\r\n");
      out.write("\t    position: absolute;\r\n");
      out.write("\t    left: 0;\r\n");
      out.write("\t    right: 0;\r\n");
      out.write("\t    top:219px;\r\n");
      out.write("\t    width : 120px;\r\n");
      out.write("\t    height: 3px;\r\n");
      out.write("\t    content: '';\r\n");
      out.write("\t    background-color: #00a0e2;\r\n");
      out.write("\t    \r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#bannerh2.tough::after {\r\n");
      out.write("\t\r\n");
      out.write("\t\tmargin : 0 43.8%;\r\n");
      out.write("\t    position: absolute;\r\n");
      out.write("\t    left: 0;\r\n");
      out.write("\t    right: 0;\r\n");
      out.write("\t    top:219px;\r\n");
      out.write("\t    width : 198px;\r\n");
      out.write("\t    height: 3px;\r\n");
      out.write("\t    content: '';\r\n");
      out.write("\t    background-color: #00a0e2;\r\n");
      out.write("\t    \r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#bannerh2.jelly::after {\r\n");
      out.write("\t\r\n");
      out.write("\t\tmargin : 0 46.23%;\r\n");
      out.write("\t    position: absolute;\r\n");
      out.write("\t    left: 0;\r\n");
      out.write("\t    right: 0;\r\n");
      out.write("\t    top:219px;\r\n");
      out.write("\t    width : 118px;\r\n");
      out.write("\t    height: 3px;\r\n");
      out.write("\t    content: '';\r\n");
      out.write("\t    background-color: #00a0e2;\r\n");
      out.write("\t    \r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#bannerh2::after_clearj {\r\n");
      out.write("\t\r\n");
      out.write("\t\tmargin : 0 46.27%;\r\n");
      out.write("\t    position: absolute;\r\n");
      out.write("\t    left: 0;\r\n");
      out.write("\t    right: 0;\r\n");
      out.write("\t    top:219px;\r\n");
      out.write("\t    width : 120px;\r\n");
      out.write("\t    height: 3px;\r\n");
      out.write("\t    content: '';\r\n");
      out.write("\t    background-color: #00a0e2;\r\n");
      out.write("\t    \r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#bannerh2::after_colorj {\r\n");
      out.write("\t\r\n");
      out.write("\t\tmargin : 0 46.27%;\r\n");
      out.write("\t    position: absolute;\r\n");
      out.write("\t    left: 0;\r\n");
      out.write("\t    right: 0;\r\n");
      out.write("\t    top:219px;\r\n");
      out.write("\t    width : 120px;\r\n");
      out.write("\t    height: 3px;\r\n");
      out.write("\t    content: '';\r\n");
      out.write("\t    background-color: #00a0e2;\r\n");
      out.write("\t    \r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#bannerh2.limited::after {\r\n");
      out.write("\t\r\n");
      out.write("\t\tmargin : 0 45.6%;\r\n");
      out.write("\t    position: absolute;\r\n");
      out.write("\t    left: 0;\r\n");
      out.write("\t    right: 0;\r\n");
      out.write("\t    top:219px;\r\n");
      out.write("\t    width : 140.6px;\r\n");
      out.write("\t    height: 3px;\r\n");
      out.write("\t    content: '';\r\n");
      out.write("\t    background-color: #00a0e2;\r\n");
      out.write("\t    \r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#banner2 {\r\n");
      out.write("\t\r\n");
      out.write("\t\tmargin-left: 22.25%;\r\n");
      out.write("\t\tmargin-right: 20%;\r\n");
      out.write("\t\r\n");
      out.write("\t\tcursor : pointer;\r\n");
      out.write("\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t#banner2 div {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tdisplay: inline-block;\r\n");
      out.write("\t\tcolor: black;\r\n");
      out.write("\t\tfont-weight: 900;\r\n");
      out.write("\t\tfont-size: 18px;\r\n");
      out.write("\t\tmargin-right: 32px;\r\n");
      out.write("\t\tmargin-bottom: 50px;\r\n");
      out.write("\t\r\n");
      out.write("\t}\r\n");
      out.write("\t#banner2 div:hover {\r\n");
      out.write("\t\tcolor: #00a0e2;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\th2 {\r\n");
      out.write("\t\r\n");
      out.write("\t\tmargin-bottom: 70px;\r\n");
      out.write("\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.col-sm-4 {\r\n");
      out.write("\t\tborder-top-width: 6px;\r\n");
      out.write("\t\tmargin-bottom: 40px;\r\n");
      out.write("\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.pageNumber {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tfont-size:16px; \r\n");
      out.write("\t\tfont-weight:bold;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.pagination {\r\n");
      out.write("\t  display: block;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.pagination a {\r\n");
      out.write("\t  color: black;\r\n");
      out.write("\t  padding: 3px 10px;\r\n");
      out.write("\t  text-decoration: none;\r\n");
      out.write("\t  cursor : pointer;\r\n");
      out.write("\t  margin : 0 10px;\r\n");
      out.write("\t}\r\n");
      out.write(" \t\r\n");
      out.write("\t.pagination span.active {\r\n");
      out.write("\t \tborder : solid 2px black;\r\n");
      out.write("\t \tcolor: black;\r\n");
      out.write("\t\tpadding: 3px 10px;\r\n");
      out.write("\t\ttext-decoration: none;\r\n");
      out.write("\t\tcursor : pointer;\r\n");
      out.write("\t\tmargin : 0 10px;\r\n");
      out.write("\t\tfont-size: 16px; \r\n");
      out.write("\t\tfont-weight: bold;  \r\n");
      out.write("\t}\r\n");
      out.write(" \t\r\n");
      out.write("\t.pagination a:hover, .pagination span:hover {\r\n");
      out.write("\t   text-decoration: underline;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" >\r\n");
      out.write("\r\n");
      out.write(" $(function() {\r\n");
      out.write("\t \r\n");
      out.write("\t var catename = $(\"#bannerh2\").text();\r\n");
      out.write("\t \r\n");
      out.write("\t if( \"HARD CASE\" == catename){\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t $(\"#bannerh2\").toggleClass('hard');\r\n");
      out.write("\t\t \r\n");
      out.write("\t }\r\n");
      out.write("\t else if(\"TOUGH/SLIDE CASE\" == catename){\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t $(\"#bannerh2\").toggleClass('tough');\r\n");
      out.write("\t\t \r\n");
      out.write("\t }\r\n");
      out.write("\t else if(\"LIMITED CASE\" == catename){\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t $(\"#bannerh2\").toggleClass('limited');\r\n");
      out.write("\t\t \r\n");
      out.write("\t }\r\n");
      out.write("\telse {\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t $(\"#bannerh2\").toggleClass('jelly');\r\n");
      out.write("\t\t \r\n");
      out.write("\t }\r\n");
      out.write("\t \r\n");
      out.write("\t \r\n");
      out.write(" });\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<div id=\"contents\"> \r\n");
      out.write("<div class=\"container text-center\"> \r\n");
      out.write("\r\n");
      out.write("\t");
      if (_jspx_meth_c_005fchoose_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("  \r\n");
      out.write("  <div class=\"row\">\r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  ");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("  \r\n");
      out.write("  ");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write(" \r\n");
      out.write("  \r\n");
      out.write("</div>\r\n");
      out.write("   <div class=\"pagination\">\r\n");
      out.write("\t\r\n");
      out.write("\t\t");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageBar}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("  </div>\r\n");
      out.write(" \r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../footer.jsp", out, false);
      out.write('\r');
      out.write('\n');
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

  private boolean _jspx_meth_c_005fchoose_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:choose
    org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_005fchoose_005f0 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _005fjspx_005ftagPool_005fc_005fchoose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
    boolean _jspx_th_c_005fchoose_005f0_reused = false;
    try {
      _jspx_th_c_005fchoose_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fchoose_005f0.setParent(null);
      int _jspx_eval_c_005fchoose_005f0 = _jspx_th_c_005fchoose_005f0.doStartTag();
      if (_jspx_eval_c_005fchoose_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t");
          if (_jspx_meth_c_005fwhen_005f0(_jspx_th_c_005fchoose_005f0, _jspx_page_context))
            return true;
          out.write("\r\n");
          out.write("\t\t\r\n");
          out.write("\t\t");
          if (_jspx_meth_c_005fwhen_005f1(_jspx_th_c_005fchoose_005f0, _jspx_page_context))
            return true;
          out.write("\r\n");
          out.write("\t\r\n");
          out.write("\t\t");
          if (_jspx_meth_c_005fotherwise_005f0(_jspx_th_c_005fchoose_005f0, _jspx_page_context))
            return true;
          out.write('\r');
          out.write('\n');
          out.write('	');
          int evalDoAfterBody = _jspx_th_c_005fchoose_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fchoose_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f0);
      _jspx_th_c_005fchoose_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fchoose_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fchoose_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fwhen_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fchoose_005f0, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_005fwhen_005f0 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    boolean _jspx_th_c_005fwhen_005f0_reused = false;
    try {
      _jspx_th_c_005fwhen_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fwhen_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f0);
      // /WEB-INF/product/productList.jsp(223,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fwhen_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ category.cateno eq 3 }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fwhen_005f0 = _jspx_th_c_005fwhen_005f0.doStartTag();
      if (_jspx_eval_c_005fwhen_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t<div id = \"banner\">\r\n");
          out.write("\t  \t\t<h2 style = \"margin-bottom : 32px;\">\r\n");
          out.write("\t  \t\t\t<span id = \"bannerh2\">JELLY CASE</span>\r\n");
          out.write("\t  \t\t</h2>\r\n");
          out.write("\t\t\t</div>\r\n");
          out.write("\t\t\t<div id = \"banner2\">\r\n");
          out.write("\t\t\t  \t<div onclick=\"location.href='/Semi/product/list.sa?cateno=3'\" style = \"color: #00a0e2;\">CLEAR JELLY CASE</div>\r\n");
          out.write("\t\t\t  \t<div onclick=\"location.href='/Semi/product/list.sa?cateno=4'\">COLOR JELLY CASE</div>\r\n");
          out.write("\t\t\t</div>\r\n");
          out.write("\t\t");
          int evalDoAfterBody = _jspx_th_c_005fwhen_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fwhen_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f0);
      _jspx_th_c_005fwhen_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fwhen_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fwhen_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fwhen_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fchoose_005f0, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_005fwhen_005f1 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    boolean _jspx_th_c_005fwhen_005f1_reused = false;
    try {
      _jspx_th_c_005fwhen_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fwhen_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f0);
      // /WEB-INF/product/productList.jsp(235,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fwhen_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ category.cateno eq 4 }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fwhen_005f1 = _jspx_th_c_005fwhen_005f1.doStartTag();
      if (_jspx_eval_c_005fwhen_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t<div id = \"banner\">\r\n");
          out.write("\t  \t\t<h2 style = \"margin-bottom : 32px;\">\r\n");
          out.write("\t  \t\t\t<span id = \"bannerh2\">JELLY CASE</span>\r\n");
          out.write("\t  \t\t</h2>\r\n");
          out.write("\t\t\t</div>\r\n");
          out.write("\t\t\t<div id = \"banner2\">\r\n");
          out.write("\t\t\t  \t<div onclick=\"location.href='/Semi/product/list.sa?cateno=3'\" >CLEAR JELLY CASE</div>\r\n");
          out.write("\t\t\t  \t<div onclick=\"location.href='/Semi/product/list.sa?cateno=4'\" style = \"color: #00a0e2;\">COLOR JELLY CASE</div>\r\n");
          out.write("\t\t\t</div>\r\n");
          out.write("\t\t");
          int evalDoAfterBody = _jspx_th_c_005fwhen_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fwhen_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f1);
      _jspx_th_c_005fwhen_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fwhen_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fwhen_005f1_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fotherwise_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fchoose_005f0, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:otherwise
    org.apache.taglibs.standard.tag.common.core.OtherwiseTag _jspx_th_c_005fotherwise_005f0 = (org.apache.taglibs.standard.tag.common.core.OtherwiseTag) _005fjspx_005ftagPool_005fc_005fotherwise.get(org.apache.taglibs.standard.tag.common.core.OtherwiseTag.class);
    boolean _jspx_th_c_005fotherwise_005f0_reused = false;
    try {
      _jspx_th_c_005fotherwise_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fotherwise_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f0);
      int _jspx_eval_c_005fotherwise_005f0 = _jspx_th_c_005fotherwise_005f0.doStartTag();
      if (_jspx_eval_c_005fotherwise_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t<div id = \"banner\">\r\n");
          out.write("\t\t  \t\t<h2>\r\n");
          out.write("\t\t  \t\t\t<span id = \"bannerh2\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ category.catename }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write(" CASE</span>\r\n");
          out.write("\t\t  \t\t</h2>\r\n");
          out.write("\t  \t\t</div>\r\n");
          out.write("\t\t");
          int evalDoAfterBody = _jspx_th_c_005fotherwise_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fotherwise_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fotherwise.reuse(_jspx_th_c_005fotherwise_005f0);
      _jspx_th_c_005fotherwise_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fotherwise_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fotherwise_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /WEB-INF/product/productList.jsp(259,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ not empty productList }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ productListHtml }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("\r\n");
          out.write("  ");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f1_reused = false;
    try {
      _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f1.setParent(null);
      // /WEB-INF/product/productList.jsp(263,2) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ empty productList }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
      if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("  \t<div class=\"col-sm-4\">\r\n");
          out.write("  \t  <span> 등록된 상품이 없습니다. </span>\r\n");
          out.write("    </div>\r\n");
          out.write("  ");
          int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      _jspx_th_c_005fif_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f1_reused);
    }
    return false;
  }
}