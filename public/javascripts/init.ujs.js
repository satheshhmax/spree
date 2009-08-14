function subscribe_ajax_links()
{
	jQuery(".ajax_link").click = null;
	jQuery(".ajax_link").click(function() {
		jQuery('#ajax-loader').show();
		jQuery.get(  jQuery(this).attr("href"), {},
				function (data, textStatus) { jQuery('#ajax-loader').hide(); },
				"script");
		return false;
	});
}

function subscribe_ajax_forms()
{
	if (jQuery(".ajax_form").length > 0)
	{
		jQuery(".ajax_form").submit(function() {
			jQuery(this).hide();
			//jQuery(".form").append("<div class='loading'><img src='/facebox/loading.gif' alt='loading...' /><p>Процесс идёт, ждите...</p></div>")
			jQuery.post(jQuery(this).attr("action"), jQuery(this).serialize(), null, "script");
			return false;
		});
	}

	/*jQuery('#facebox .close').click(jQuery.facebox.close);
	jQuery('#slate .cancel').click(function(){
		jQuery('#slate').remove();
		return false;
	});*/
	subscribe_ajax_links();
}

jQuery(document).ready(function() {

	subscribe_ajax_forms();
	//jQuery('a[rel*=facebox]').facebox();	
    jQuery('.taxon_link').click(function(){   
		jQuery(this).parent().parent().children('ul').toggleClass('hidden');
		return false;
	});

});

