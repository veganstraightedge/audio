module ApplicationHelper
  # formerly lib/url...
  def sanatized_album_seo_path album
    album_seo_path(album, sanatize_for_url(album.name), sanatize_for_url(album.band.name))
  end

  def sanatized_band_seo_path band
    band_seo_path(band, sanatize_for_url(band.name))
  end

  def sanatized_song_seo_path song
    song_seo_path(song,
                  sanatize_for_url(song.pretty_name),
                  sanatize_for_url(song.album.band.name),
                  sanatize_for_url(song.album.name))
  end

  def sanatize_for_url thing
    thing.downcase.gsub(/&/, 'and').tr(' ', '-').gsub(%r{,|\.|'|/|\\|!|:|\?|#|\(|\)|\[|\]}, '').gsub(/--/, '-')
  end
  # ...formerly lib/url

  # temp user auth helper stubs
  def logged_in?
    false
  end

  def remote_audio_url song
    band  = sluggify(song.album.band.name)
    album = sluggify(song.album.name)
    song  = sluggify(song.name)

    "http://theresistancearmy.s3.amazonaws.com/audio/bands/#{band}/#{album}/#{song}.mp3"
  end

  def sluggify text, separator = '-'
    text.downcase.gsub(/\(|\)|\[|\]/, '')
        .gsub(/\./, separator)
        .gsub(/-$|,|!|'/, '')
        .gsub(/&amp;/, '')
        .gsub(/-/, separator)
        .gsub(/ /, separator)
  end

  # head
  def page_title
    tra = 'The Resistance Army Audio Project'
    @title.nil? ? tra : "#{@title} | #{tra}"
  end

  # convenience text
  def alt word
    content_tag(:abbr, word, class: 'alt')
  end

  def by
    alt 'by'
  end

  def from
    alt 'from'
  end

  # html classes
  def classifize thing
    thing.to_s.downcase.gsub(/[\.|,|!|'|&]/, '').tr(' ', '_').gsub(/__/, '_')
  end

  # forms
  def submit_button_tag button_text = 'Save', css_classes = ''
    content_tag(:button, button_text, type: 'submit', class: css_classes + ' positive button')
  end

  def cancel_link_tag plural_path, singular_path = nil
    singular_path ||= plural_path
    link_to 'Cancel',
            (controller.action_name == 'index' ? plural_path : singular_path),
            confirm: "Are you sure you want to cancel? You will lose all changes you've made on this page.",
            class:   'cancel'
  end

  def form_buttons plural_path, singular_path = nil, button_text = 'Save'
    content_tag(
      :div,
      submit_button_tag(button_text) + cancel_link_tag(plural_path, singular_path),
      class: 'buttons'
    )
  end

  # misc
  def show_action?
    controller.action_name == 'show'
  end
end
