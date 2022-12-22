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
    end 
  end

  def xml_transform
    xslt = Nokogiri::XSLT(File.read(XSLT_PATH))
    xslt.transform(@response_xml)
  end
end