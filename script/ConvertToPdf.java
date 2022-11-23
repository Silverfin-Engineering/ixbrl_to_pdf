/*
* START LICENSE NOTIFICATION
*
*    This file is part of the Silverfin Integration Application project.
*    Copyright (c) 2013-2021 Silverfin NV
*    Authors: Silverfin
*
*    This program is free software; you can redistribute it and/or modify
*    it under the terms of the GNU Affero General Public License version 3
*    as published by the Free Software Foundation with the addition of the
*    following permission added to Section 15 as permitted in Section 7(a):
*    FOR ANY PART OF THE COVERED WORK IN WHICH THE COPYRIGHT IS OWNED BY
*    SILVERFIN. SILVERFIN GROUP DISCLAIMS THE WARRANTY OF NON INFRINGEMENT
*    OF THIRD PARTY RIGHTS
*
*    This program is distributed in the hope that it will be useful, but
*    WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
*    or FITNESS FOR A PARTICULAR PURPOSE.
*    See the GNU Affero General Public License for more details.
*    You should have received a copy of the GNU Affero General Public License
*    along with this program; if not, see http://www.gnu.org/licenses or write to
*    the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
*    Boston, MA, 02110-1301 USA, or download the license from the following URL:
*    http://www.gnu.org/licenses/#AGPL
*
*    The interactive user interfaces in modified source and object code versions
*    of this program must display Appropriate Legal Notices, as required under
*    Section 5 of the GNU Affero General Public License.
*
*    For more information, please contact Silverfin at https://community.silverfin.com/
*
* END LICENSE NOTIFICATION
*/
// Run locally:
// java -cp '*' ConvertToPdf.java
//
// Compile has to be done in the Dockerfile to have the correct Java version
// javac -cp 'script/ixbrl_to_pdf/.:script/ixbrl_to_pdf/core-renderer.jar:script/ixbrl_to_pdf/iText-2.0.8.jar' script/ixbrl_to_pdf/ConvertToPdf.java
// Run compiled version:
// java -cp 'script/ixbrl_to_pdf/.:script/ixbrl_to_pdf/core-renderer.jar:script/ixbrl_to_pdf/iText-2.0.8.jar' ConvertToPdf script/ixbrl_to_pdf/example_file.html

// package org.xhtmlrenderer;

import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.xhtmlrenderer.pdf.ITextRenderer;
import org.xhtmlrenderer.resource.FSEntityResolver;
import com.lowagie.text.DocumentException;

public class ConvertToPdf {
  public static void main(String args[]) {
    try {
      String source_file_name = args[0];
      String[] parts = source_file_name.split("\\.");
      String file_name = parts[0];
      String extenstion = parts[0];

      InputStream ins = new FileInputStream(source_file_name);
      String outputFile = "" + file_name + ".pdf";
      OutputStream os = new FileOutputStream(outputFile);

      final DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
      documentBuilderFactory.setValidating(false);
      DocumentBuilder builder = documentBuilderFactory.newDocumentBuilder();
      builder.setEntityResolver(FSEntityResolver.instance());
      Document document = builder.parse(ins);

      ITextRenderer renderer1 = new ITextRenderer();
      renderer1.setDocument(document, null);
      renderer1.layout();
      renderer1.createPDF(os);
      System.out.println(outputFile);
    } catch (Exception e) {
      System.out.println("error");
      System.out.println("" + e + "");
      // e.printStackTrace;
    } finally {
    }
  }
}
