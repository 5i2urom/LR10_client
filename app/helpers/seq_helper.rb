module SeqHelper
  URL_SERVER = 'http://127.0.0.1:3000/result.xml'
  XSLT_PATH = 'public/output.xslt'

  def seq = params[:str]
  def len = params[:num]
  def mode = params[:mode]

  def show_result(mode)
    case mode
    when 'html'
      render inline: xml_transform
    when 'xml'
      render xml: @response_xml
    when 'server'
      render inline: client_transform
    end
  end

  def xml_transform
    xslt = Nokogiri::XSLT(File.read(XSLT_PATH))
    xslt.transform(@response_xml)
  end

  def client_transform
    doc = Nokogiri::XML(@server_respone)
    xslt = Nokogiri::XML::ProcessingInstruction.new(
      doc, 'xml-stylesheet', "type=\"text/xsl\" href=\"#{XSLT_PATH}\""
    )
    doc.root.add_previous_sibling(xslt)
    doc
  end
end