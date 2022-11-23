# frozen_string_literal: true

# START LICENSE NOTIFICATION
#
#    This file is part of the Silverfin Integration Application project.
#    Copyright (c) 2013-2021 Silverfin NV
#    Authors: Silverfin
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License version 3
#    as published by the Free Software Foundation with the addition of the
#    following permission added to Section 15 as permitted in Section 7(a):
#    FOR ANY PART OF THE COVERED WORK IN WHICH THE COPYRIGHT IS OWNED BY
#    SILVERFIN. SILVERFIN GROUP DISCLAIMS THE WARRANTY OF NON INFRINGEMENT
#    OF THIRD PARTY RIGHTS
#
#    This program is distributed in the hope that it will be useful, but
#    WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
#    or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU Affero General Public License for more details.
#    You should have received a copy of the GNU Affero General Public License
#    along with this program; if not, see http://www.gnu.org/licenses or write to
#    the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
#    Boston, MA, 02110-1301 USA, or download the license from the following URL:
#    http://www.gnu.org/licenses/#AGPL
#
#    The interactive user interfaces in modified source and object code versions
#    of this program must display Appropriate Legal Notices, as required under
#    Section 5 of the GNU Affero General Public License.
#
#    For more information, please contact Silverfin at https://community.silverfin.com/
#
# END LICENSE NOTIFICATION
#
module IxbrlToPdf
  class ExportFile
    def initialize(export_file_instance_id:, company_id:, period_id:, api:)
      @export_file_instance_id = export_file_instance_id
      @company_id = company_id
      @period_id = period_id
      @api = api
    end

    def path
      file.path
    end

    def pdf_name
      export_file_instance['file_name'].ext('pdf')
    end

    private

    attr_reader :export_file_instance_id, :company_id, :period_id, :api

    def file
      @file ||= begin
        file = Tempfile.new([SecureRandom.uuid, '.html'])
        file.write(export_file_instance['content'])
        file
      end
    end

    def export_file_instance
      @export_file_instance ||= api.get_export_file_instance(
        company_id: company_id,
        period_id: period_id,
        export_file_instance_id: export_file_instance_id
      )
    end
  end
end
