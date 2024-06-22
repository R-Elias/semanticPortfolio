from flask import Blueprint, render_template, request
import lxml.etree as ET

main = Blueprint('main', __name__)

@main.route('/')
def cv():
    lang = request.args.get('lang', 'fr')
    xslt_file = "data/cv.xslt"  # Use a single XSLT file
    xml_file = "data/cv.xml"
    
    dom = ET.parse(xml_file)
    xslt = ET.parse(xslt_file)
    transform = ET.XSLT(xslt)
    
    # Pass the language as a parameter to the transformation
    newdom = transform(dom, lang=ET.XSLT.strparam(lang))
    
    return render_template("cv.html", cv_content=str(newdom))