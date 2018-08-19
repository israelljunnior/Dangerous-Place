
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="370392271351-agk25s6n5142efjgpi1ec0ms0mdpln9k.apps.googleusercontent.com">



<script>
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		var googleId = profile.getId();
		var googleNome = profile.getName();
		var googleImg = profile.getImageUrl();
		var googleEmail = profile.getEmail();

		console.log(googleId);
		console.log(googleNome);
		console.log(googleEmail);

		$.post("google", {
			'googleId' : googleId,
			'googleNome' : googleNome
		
		} );
	
	}
</script>




