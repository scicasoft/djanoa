# -*- coding: utf-8 -*-
class DjanoaMessagesController < ApplicationController
  def new_sms
    message = DjanoaMessage.create(from: params[:from], to: params[:to], message: params[:text])

    reponse = 'Hello :-)'

    respond_to do |format|
      format.xml {render xml: ({Sms: 'Hello :-)'}.to_xml(root: 'Response'))}
    end
  end
end