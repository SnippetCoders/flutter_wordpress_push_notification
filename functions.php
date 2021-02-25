add_filter('onesignal_send_notification', 'onesignal_send_notification_filter', 10, 4);
function onesignal_send_notification_filter($fields, $new_status, $old_status, $post) {
  $fields['headings'] = array("en" => "my modified title!");
  $fields['isAndroid'] = true;
  $fields['isIos'] = true;
  
  /* Important to set web_url to support opening through both mobile and browser*/
  $fields['web_url'] = $fields['url'];
  
  /* Important to unset the URL to prevent opening the browser when the notification is clicked for mobile app users */
  unset($fields['url']);

  $fields['data'] = array("post_id" => $post->ID);
  
  return $fields;
} 