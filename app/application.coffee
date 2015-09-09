App =
  init: ->
    animating = false
    $window = $(window)
    $body = $('body')
    $document = $(document)
    $ ->
      sections =  []
      list_sections = ->
        sections = _.map $('.c-mosaic-item'), (section)->
          jquery = $(section)
          {
            dom: section,
            jquery: jquery,
            offset: jquery.offset(),
            width: jquery.css("width"),
            height: jquery.height()
          }
      list_sections()

      animate = (event)->
        return if animating
        animating = true
        current_height = $('.c-mosaic').height()
        scrollTop = $window.scrollTop()
        $body.toggleClass('summary')
        future_height = $('.c-mosaic').height()
        future_document_height = $(document).height()
        $('.c-mosaic').css('min-height', Math.max(current_height, future_height))
        $window.scrollTop(scrollTop)

        if $body.hasClass('summary')
          scroll = $('.c-mosaic').offset().top
          window_height = $window.height()
          if scroll + window_height > future_document_height
            scroll = future_document_height - window_height
        else
          console.log this
          scroll = $(this).offset().top
        animation = _.map sections, (section)->
          offset = section.jquery.offset()
          {
            e: section.dom
            p: {
              top: [offset.top, section.offset.top],
              left: [offset.left, section.offset.left],
              width: [section.jquery.width(), section.width],
              height: [section.jquery.height(), section.height],
            },
            o: { sequenceQueue: false }
          }
        animation.push({
          e: $("html"),
          p: "scroll",
          o: {
            sequenceQueue: false
            offset: scroll,
            complete: ->
              setTimeout(->
                $(".c-mosaic").removeClass("animate")
                $(".c-mosaic").removeAttr("style")         
                _.each sections, (section)->
                  section.jquery.removeAttr("style")
                list_sections()
                animating = false
              , 100)
          }
        })
        $(".c-mosaic").addClass("animate")
        $.Velocity.RunSequence(animation)
      $body.on 'click', '.c-mosaic-item', animate
      # $body.addClass('summary')
module.exports = App
