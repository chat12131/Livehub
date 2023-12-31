import 'bootstrap';
import flatpickr from 'flatpickr';
import '../stylesheets/application';
import '../../assets/stylesheets/user.scss';
import '../artists';
import '../member';
import '../venue';
import '../initialize_flatpickr';
import '../ticket';
import '../add_categories';
import '../menber_in_artist';
import '../goods_liverecord';
import '../weather';
import '../charts';

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

