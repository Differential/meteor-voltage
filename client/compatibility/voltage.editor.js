(function($, undefined) {

  Voltage = {
    Editor: function(options) {

      this.init = function(options) {

        // Merge user options with defaults
        this.options = $.extend({}, {
          aceContainer: '#voltage-editor',
          dataContainer: '#voltage-data',
          btnsContainer: '#voltage-editor-btns',
          update: $.noop,
          html: $.noop,
          markdown: $.noop
        }, options);

        return this;
      };

      this.renderData = function() {
        this.$dataContainer = $(this.options.dataContainer).show();
        this.$dataContainer.html(this.options.html());
      };

      this.renderEditor = function() {

        var self = this;

        // Set up jQuery containers
        this.$aceContainer = $(this.options.aceContainer);
        this.$dataContainer = $(this.options.dataContainer);
        this.$btnsContainer = $(this.options.btnsContainer);

        // Create and configure Ace Editor instance
        this.editor = ace.edit(this.$aceContainer[0]);
        this.editor.setTheme('ace/theme/chrome');
        this.editor.setFontSize(14);
        this.editor.renderer.setShowPrintMargin(false);
        this.editor.renderer.setShowGutter(false);
        this.editor.setHighlightActiveLine(true);
        this.editor.getSession().setMode('ace/mode/markdown');
        this.editor.getSession().setUseWrapMode(true);

        this.editor.on('change', _.debounce(function(e) {
          var height = self.editor.getSession().getDocument().getLength() * self.editor.renderer.lineHeight + self.editor.renderer.scrollBar.getWidth();
          self.$aceContainer.height(height);
          return self.editor.resize();
        }, 250));

        // Set up editor buttons
        var buttons = "<button type=\"button\" class=\"for-editing btn btn-success\"><i class=\"icon-edit\"></i> Edit This Page</button>"
                    + "<div class=\"btn-group\">"
                    + "<button type=\"button\" class=\"editing for-saving btn btn-danger\"><i class=\"icon-edit\"></i> Save</button>"
                    + "<button type=\"button\" class=\"editing for-canceling btn btn-danger\"><i class=\"icon-ban-circle\"></i> Cancel</button>"
                    + "</div>"
                    + "<small style=\"vertical-align: middle; margin-left: 20px; font-size: 14px;\" class=\"editing\">"
                    + "  <a target=\"_blank\" href=\"http://daringfireball.net/projects/markdown/syntax\"><strong>Markdown</strong> syntax guide</a>"
                    + "</small>";

        this.$btnsContainer.html(buttons);
        $('.editing', this.$btnsContainer).hide();

        // Handle editing buttons
        $('.for-editing', this.$btnsContainer).on('click', this.edit);
        $('.for-saving', this.$btnsContainer).on('click', this.save);
        $('.for-canceling', this.$btnsContainer).on('click', this.cancel);

        return this;
      };

      this.edit = $.proxy(function(e) {
        e.preventDefault();

        $(e.currentTarget).hide();
        $('.editing', this.$btnsContainer).show();

        this.$dataContainer.hide()
        this.$aceContainer.show()
        this.editor.setValue(this.options.markdown())
        this.editor.focus()
        this.editor.getSelection().clearSelection();
      }, this);

      this.save = $.proxy(function(e) {
        e.preventDefault();

        $('.for-editing', this.$btnsContainer).show();
        $('.editing', this.$btnsContainer).hide();

        this.options.update(this.editor.getValue());
        this.$aceContainer.hide();
        this.$dataContainer.show();
        this.$dataContainer.html(this.options.html());
      }, this);

      this.cancel = $.proxy(function(e) {
        e.preventDefault()

        $('.for-editing', this.$btnsContainer).show();
        $('.editing', this.$btnsContainer).hide();

        this.$aceContainer.hide();
        this.$dataContainer.show();
        this.$dataContainer.html(this.options.html());
      }, this);

      this.init(options);

    } // End Editor class
  }; // End Voltage

})(window.jQuery);
