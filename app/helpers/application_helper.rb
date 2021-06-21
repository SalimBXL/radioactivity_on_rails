module ApplicationHelper

    def isRefShow
        controller.controller_name == request.original_fullpath.split("/")[1]
    end
end
