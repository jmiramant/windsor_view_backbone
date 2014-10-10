define(['handlebars'], function(Handlebars) {

this["JST"] = this["JST"] || {};

this["JST"]["./scripts/app/templates/dashboard/base_view.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return " <div id=\"panel\"></div>\n";
  });

this["JST"]["./scripts/app/templates/dashboard/charts_layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class='overview'></div>\n<div class='demographic'></div>\n<div class='geographic'></div>\n<div class='professional'></div>\n<div class='customer'></div>\n";
  });

this["JST"]["./scripts/app/templates/dashboard/footer.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<span id=\"year-copy\">2014</span> © Windsor View Corporation\n";
  });

this["JST"]["./scripts/app/templates/dashboard/header_nav.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<ul class=\"nav navbar-nav-custom\">\n  <li>\n    <a id='toggle-sidebar' href=\"#\">\n      <i class=\"fa fa-bars fa-fw\"></i>\n    </a>\n  </li>\n</ul>\n\n<ul class=\"nav navbar-nav-custom pull-right\">\n  <li id='logout'>\n    <a href=\"#\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"Logout\"><strong>Logout &nbsp;</strong><i class=\"gi gi-exit\"></i></a>\n  </li>\n</ul>\n";
  });

this["JST"]["./scripts/app/templates/dashboard/layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id='header-nav'></div>\n<div id='charts-region'></div>\n<footer class='clearfix'></footer>";
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/demographic/charts.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "";
  buffer += "\n            <img src=\""
    + escapeExpression((typeof depth0 === functionType ? depth0.apply(depth0) : depth0))
    + "\">\n          ";
  return buffer;
  }

  buffer += "  <div class=\"row\">\n    <div class=\"col-md-12\">\n      <div class=\"block\">\n        <div class=\"block-title\">\n          <h2>Gender Breakdown</h2>\n        </div>\n        <div id=\"malefemale\">\n          <svg style=\"height:500px;width:400px\"></svg>\n        </div>\n      </div>\n    </div>\n  </div>\n  <div class=\"row\">\n    <div class=\"col-md-12\">\n      <div class=\"block\">\n        <div class=\"block-title\">\n          <h2>Age Distribution</h2>\n        </div>\n        <div id=\"age_histogram\">\n          <svg style=\"height:400px;width:1000px\"></svg>\n        </div>\n      </div>\n    </div>\n  </div>\n  <div class=\"row\">\n    <div class=\"col-md-12\">\n      <div class=\"block\">\n        <div class=\"block-title\">\n          <h2>Photo Book</h2>\n        </div>\n        <div class='photo_book_loader'>\n          <td class=\"text-center\"><i class=\"fa fa-spinner fa-4x fa-spin\"></i></td>\n        </div>\n        <div id=\"photo_book\" style='display: none'>\n          ";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.profile_images), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        </div>\n      </div>\n    </div>\n  </div>";
  return buffer;
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/demographic/layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id=\"demographics\">\n  <div class=\"content-header\">\n    <div class=\"header-section\">\n      <h1>\n        <i class=\"gi gi-share_alt\"></i>Demographic Data<br><small>Demographic Data Of Social Profiles</small>\n      </h1>\n    </div>\n  </div>\n  <div class='chart-container'></div>\n</div>";
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/geographic/charts.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n       <tr role=\"row\" class=\"even\">\n        <td class=\"text-center\">"
    + escapeExpression(((stack1 = (depth0 && depth0.state)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</td>\n        <td class=\"text-center sorting_1\">"
    + escapeExpression(((stack1 = (depth0 && depth0.count)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</td>\n      </tr>\n      ";
  return buffer;
  }

  buffer += "<div class=\"block\">\n    <!-- Example Title -->\n    <div class=\"block-title\">\n      <h2>Emails Distribution Across the United States</h2>\n    </div>\n    <div id='social_profiles_map'></div>\n</div>\n<!-- END Example Block -->\n<div class=\"block\">\n\n  <div class=\"block-title\">\n    <h2>Emails Found by State</h2>\n  </div>\n  <strong>\n  <div class=\"table-responsive\">\n    <table id=\"states_table\" class=\"table table-vcenter table-condensed table-bordered\">\n      <thead>\n        <tr>\n          <th class=\"text-center\">State</th>\n          <th class=\"text-center\">Number of Profiles</th>\n        </tr>\n      </thead>\n      <tbody>\n       ";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.state_counts_list), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    </tbody>\n\n    <tfoot>\n      <tr>\n        <th class=\"text-center\">State</th>\n        <th class=\"text-center\">Number of Profiles</th>\n      </tr>\n    </tfoot>\n  </table>\n</div>\n</div>\n</strong>\n<!-- END Example Block -->\n<div class=\"block\">\n  <!-- Example Title -->\n  <div class=\"block-title\">\n    <h2>Social Influence by State</h2>\n  </div>\n  <p>Coming Soon!</p>\n</div>";
  return buffer;
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/geographic/layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id=\"geographics\">\n  <div class=\"content-header\">\n    <div class=\"header-section\">\n      <h1>\n        <i class=\"fa fa-compass\"></i>Geographic Data<br><small>Geographic Data Of Social Profiles</small>\n      </h1>\n    </div>\n  </div>\n  <div class='chart-container'></div>\n</div>";
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/overview/charts.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, helper, functionType="function", escapeExpression=this.escapeExpression;


  buffer += "		<div class=\"row\">\n			<div class=\"col-md-12\">\n				<div class=\"widget\">\n					<div class=\"widget-extra themed-background-email\">\n						<h3 class=\"widget-content-light\">Email Analysis - <strong>";
  if (helper = helpers.processed) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.processed); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</strong> Emails Processed</h3>\n					</div>\n				</div>\n			</div>\n		</div>\n\n		<div class=\"row\">\n			<div class=\"col-md-12\">\n				<div class=\"block\">\n					<div class=\"block-title\"><h1>Email Summary</h1></div>\n					<div class=\"row\" style='margin-bottom: 20px'>\n						<div class=\"col-md-6\">\n							<div class=\"block\">\n								<div class=\"block-title\">\n									<h2>Emails by Top Level Domains</h2>\n								</div>\n								<div id=\"email_pie_chart_1\">\n									<svg style=\"width:500px; height:500px;\"></svg>\n								</div>\n							</div>\n						</div>\n						<div class=\"col-md-6\">\n							<div class=\"block\">\n								<div class=\"block-title\">\n									<h2>Emails by Provider</h2>\n								</div>\n								<div id=\"email_pie_chart_2\">\n									<svg style=\"width:500px; height:500px;\"></svg>\n								</div>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n\n		<div class=\"row\" style='margin-top: 20px;'>\n			<div class=\"col-md-12\">\n				<div class=\"widget\">\n					<div class=\"widget-extra themed-background-email\">\n						<h3 class=\"widget-content-light\">Social Network Footprint from Emails</h3>\n					</div>\n				</div>\n			</div>\n		</div>\n\n		<div class=\"block\">\n\n			<div class=\"block-title\">\n				<h1>Transforming Emails into Social</h1>\n			</div>\n\n			<div class=\"row\" style='margin-bottom: 20px;'>\n				<div class=\"col-sm-4\">\n					<div class=\"block\" style='margin-bottom: 0'>\n						<div class=\"block-title text-center themed-background-email\">\n							<h3 style=\"color:white;\"><strong>Percent Emails with Data</strong></h3>\n						</div>\n						<div class=\"widget-extra-full text-center\">\n							<h2><strong>";
  if (helper = helpers.percent_emails_with_data) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.percent_emails_with_data); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</strong></h2>\n						</div>\n					</div>\n				</div>\n\n				<div class=\"col-sm-4\">\n					<div class=\"block\">\n						<div class=\"block-title text-center themed-background-email\">\n							<h3 style=\"color:white;\"><strong>Average Social Profiles Per Email</strong></h3>\n						</div>\n						<div class=\"widget-extra-full text-center\">\n							<h2><strong>";
  if (helper = helpers.avgProfiles) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.avgProfiles); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</strong></h2>\n						</div>\n					</div>\n				</div>\n\n				<div class=\"col-sm-4\">\n					<div class=\"block\">\n						<div class=\"block-title themed-background-email text-center\">\n							<h3 style=\"color:white;\"><strong>Social Networks Covered</strong></h3><strong>\n						</strong></div><strong>\n						<div class=\"widget-extra-full text-center\">\n							<h2><strong>";
  if (helper = helpers.num_social_networks) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.num_social_networks); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</strong></h2>\n						</div>\n					</strong></div>\n				</div>\n\n			</div>\n		</div>\n\n		<div class=\"row\">\n			<div class=\"col-md-6\">\n				<div class=\"block\">\n					<div class=\"block-title\">\n						<h2>Distribution of Social Profiles</h2>\n					</div>\n					<div id='chart' class=\"nvd3\">\n						<svg style='height:400px; width:100%;'></svg>\n					</div>\n				</div>\n			</div>\n			<div class=\"col-md-6\">\n				<div class=\"block\">\n					<div class=\"block-title\">\n						<h2>Gender Breakdown</h2>\n					</div>\n					<div id=\"malefemale\">\n						<svg style='height:400px;width:100%'></svg>\n					</div>\n				</div>\n			</div>\n		</div>";
  return buffer;
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/overview/layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id=\"dashboard\">\n\n	<div class=\"content-header\">\n		<div class=\"header-section\">\n			<h1><i class=\"fa fa-dashboard\"></i>Dashboard<br><small>An Overview of Your Social Profiles</small></h1>\n		</div>\n	</div>\n	<div class='chart-container'></div>\n</div>";
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/professional/chart.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n			<tr>\n				<td><a href=\""
    + escapeExpression(((stack1 = (depth0 && depth0.url)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" target=\"_blank\">"
    + escapeExpression(((stack1 = (depth0 && depth0.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></td>\n				<td>"
    + escapeExpression(((stack1 = (depth0 && depth0.url)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</td>\n				<td>"
    + escapeExpression(((stack1 = (depth0 && depth0.bio)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</td>\n			</tr>\n			";
  return buffer;
  }

  buffer += "<div class=\"block-title\">\n	<h2>Professional Overview</h2>\n</div>\n<strong>\n<div class=\"table-responsive\">\n	<table id=\"li_summary_table\" class=\"table table-vcenter table-condensed table-bordered\">\n		<thead>\n			<tr>\n				<th class=\"text-center\"><i class=\"si si-linked_in\"></i></th>\n				<th>Profile URL</th>\n				<th class=\"text-center\">Profile Summary</th>\n			</tr>\n		</thead>\n		<tfoot>\n			<tr>\n				<th class=\"text-center\"><i class=\"si si-linked_in\"></i></th>\n				<th>Profile URL</th>\n				<th class=\"text-center\">Profile Summary</th>\n			</tr>\n		</tfoot>\n		<tbody>\n			";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.li_profiles), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n		</tbody>\n	</table>\n</div>\n</strong>";
  return buffer;
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/professional/layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id=\"linkedin\" style=\"\">\n  <div class=\"content-header\">\n    <div class=\"header-section\">\n      <h1>\n        <i class=\"si si-linked_in\"></i>Professional Data<br><small>Professional Data from Social Profiles</small>\n      </h1>\n    </div>\n  </div>\n	<div class=\"block chart-container\"></div>\n</div>\n";
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/twitter/analysis/charts.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "  <div class=\"row\">\n    <div class=\"col-md-12\">\n      <div class=\"block\">\n        <div class=\"block-title\">\n          <h2>Counts by Day of Key Words Appearing in Tweet Text</h2>\n        </div>\n        <div id='stream_chart1' style='width:100%;'>\n          <svg style='height:500px; width:100%;' />\n        </div>\n      </div>\n    </div>\n  </div>\n\n  <div class=\"row\">\n    <div class=\"col-md-12\">\n      <div class=\"block\">\n        <div class=\"block-title\">\n          <h2>Counts by Day of Hashtags</h2>\n        </div>\n        <div id='stream_chart2' style='width:100%;'>\n          <svg style='height:500px;  width:100%;' />\n        </div>\n      </div>\n    </div>\n  </div>\n\n  <div class=\"row\">\n    <div class=\"col-md-12\">\n      <div class=\"block\">\n        <div class=\"block-title\">\n          <h2>Counts by Day of User Mentions</h2>\n        </div>\n        <div id='stream_chart3' style='width:100%'>\n          <svg style='height:500px;  width:100%;' />\n        </div>\n      </div>\n    </div>\n  </div>\n";
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/twitter/analysis/layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id=\"twitter_feed\">\n    <div class=\"content-header\">\n        <div class=\"header-section\">\n            <h1><i class=\"fa fa-twitter\"></i>Feed Analysis<br><small>An Analysis of the Twitter Stream for your Users</small></h1>\n        </div>\n    </div>\n  <div class='chart-container'></div>\n</div>\n\n";
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/twitter/overview/charts.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, helper, options, helperMissing=helpers.helperMissing, escapeExpression=this.escapeExpression, functionType="function", self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1, helper, options;
  buffer += "\n                <tr>\n                  <td class=\"text-center\">"
    + escapeExpression((helper = helpers.increment || (depth0 && depth0.increment),options={hash:{},data:data},helper ? helper.call(depth0, (data == null || data === false ? data : data.index), options) : helperMissing.call(depth0, "increment", (data == null || data === false ? data : data.index), options)))
    + "</td>\n\n                  <td class=\"text-center\"><a href=\"";
  if (helper = helpers.url) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.url); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "\" target=\"_blank\">";
  if (helper = helpers.screen_name) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.screen_name); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</a></td>\n\n                  <td class=\"text-center\">";
  if (helper = helpers.statuses_count) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.statuses_count); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</td>\n                </tr>\n                ";
  return buffer;
  }

function program3(depth0,data) {
  
  var buffer = "", stack1, helper, options;
  buffer += "\n                <tr>\n                  <td class=\"text-center\">"
    + escapeExpression((helper = helpers.increment || (depth0 && depth0.increment),options={hash:{},data:data},helper ? helper.call(depth0, (data == null || data === false ? data : data.index), options) : helperMissing.call(depth0, "increment", (data == null || data === false ? data : data.index), options)))
    + "</td>\n                  <td class=\"text-center\"><a href=\"";
  if (helper = helpers.url) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.url); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "\" target=\"_blank\">";
  if (helper = helpers.screen_name) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.screen_name); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</a></td>\n                  <td class=\"text-center\">";
  if (helper = helpers.statuses_count) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.statuses_count); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</td>\n                </tr>\n                ";
  return buffer;
  }

  buffer += "  <div class=\"row\">\n    <div class=\"col-md-12\">\n      <div class=\"widget\">\n        <div class=\"widget-extra themed-background-twitter\">\n          <h3 class=\"widget-content-light\"><i class=\"fa fa-twitter\"></i> Twitter</h3>\n        </div>\n      </div>\n    </div>\n  </div>\n  <div class=\"block \">\n    <h4 class=\"sub-header\">Total Impact of Your Twitter Users</h4>\n    <div class=\"row\">\n      <div class=\"col-sm-3\">\n\n        <div class=\"block\">\n          <div class=\"block-title text-center themed-background-twitter\">\n            <h3 style=\"color:white;\"><strong>Twitter Profiles</strong></h3>\n          </div>\n          <div class=\"widget-extra-full text-center\">\n            <h2><strong>"
    + escapeExpression((helper = helpers.formatNum || (depth0 && depth0.formatNum),options={hash:{},data:data},helper ? helper.call(depth0, (depth0 && depth0.num_twitter_profiles), options) : helperMissing.call(depth0, "formatNum", (depth0 && depth0.num_twitter_profiles), options)))
    + "</strong></h2>\n          </div>\n        </div>\n      </div>\n      <div class=\"col-sm-3\">\n\n        <div class=\"block\">\n          <div class=\"block-title text-center themed-background-twitter\">\n            <h3 style=\"color:white;\"><strong>Lifetime Tweets</strong></h3>\n          </div>\n          <div class=\"widget-extra-full text-center\">\n            <h2><strong>"
    + escapeExpression((helper = helpers.formatNum || (depth0 && depth0.formatNum),options={hash:{},data:data},helper ? helper.call(depth0, (depth0 && depth0.lifetime_tweets), options) : helperMissing.call(depth0, "formatNum", (depth0 && depth0.lifetime_tweets), options)))
    + "</strong></h2>\n          </div>\n        </div>\n      </div>\n      <div class=\"col-sm-3\">\n\n        <div class=\"block\">\n          <div class=\"block-title themed-background-twitter text-center\">\n            <h3 style=\"color:white;\"><strong>Total Followers</strong></h3><strong>\n          </strong></div><strong>\n          <div class=\"widget-extra-full text-center\">\n            <h2><strong>"
    + escapeExpression((helper = helpers.formatNum || (depth0 && depth0.formatNum),options={hash:{},data:data},helper ? helper.call(depth0, (depth0 && depth0.total_followers), options) : helperMissing.call(depth0, "formatNum", (depth0 && depth0.total_followers), options)))
    + "</strong></h2>\n          </div>\n        </strong></div>\n      </strong></div><strong>\n      <div class=\"col-sm-3\">\n\n        <div class=\"block\">\n          <div class=\"block-title text-center themed-background-twitter\">\n            <h3 style=\"color:white;\"><strong>Total Lists</strong></h3>\n          </div>\n          <div class=\"widget-extra-full text-center\">\n            <h2><strong>"
    + escapeExpression((helper = helpers.formatNum || (depth0 && depth0.formatNum),options={hash:{},data:data},helper ? helper.call(depth0, (depth0 && depth0.total_lists), options) : helperMissing.call(depth0, "formatNum", (depth0 && depth0.total_lists), options)))
    + "</strong></h2>\n          </div>\n        </div>\n      </div>\n    </strong></div>\n    <h4 class=\"sub-header\">General Statistics About Your Twitter Users</h4>\n  </strong>\n  <div class=\"row\">\n    <div class=\"col-sm-4\">\n      <div class=\"block\">\n        <div class=\"block-title text-center themed-background-twitter\">\n          <h3 style=\"color:white;\" <strong=\"\"><strong>Users with More Than 50 Followers</strong></h3>\n        </div>\n        <div class=\"widget-extra-full text-center\">\n          <h2><strong>"
    + escapeExpression((helper = helpers.formatNum || (depth0 && depth0.formatNum),options={hash:{},data:data},helper ? helper.call(depth0, (depth0 && depth0.fifty_plus_followers), options) : helperMissing.call(depth0, "formatNum", (depth0 && depth0.fifty_plus_followers), options)))
    + "</strong></h2>\n        </div>\n      </div>\n    </div>\n    <div class=\"col-sm-4\">\n\n      <div class=\"block\">\n        <div class=\"block-title text-center themed-background-twitter\">\n          <h3 style=\"color:white;\"><strong>Users Active within 6 Months</strong></h3>\n        </div>\n        <div class=\"widget-extra-full text-center\">\n          <h2><strong>"
    + escapeExpression((helper = helpers.formatNum || (depth0 && depth0.formatNum),options={hash:{},data:data},helper ? helper.call(depth0, (depth0 && depth0.active_within_180_days), options) : helperMissing.call(depth0, "formatNum", (depth0 && depth0.active_within_180_days), options)))
    + "</strong></h2>\n        </div>\n      </div>\n    </div>\n    <div class=\"col-sm-4\">\n\n      <div class=\"block\">\n        <div class=\"block-title text-center themed-background-twitter\">\n          <h3 style=\"color:white;\"><strong>Average Number of Followers</strong></h3>\n        </div>\n        <div class=\"widget-extra-full text-center\">\n          <h2><strong>"
    + escapeExpression((helper = helpers.twoDec || (depth0 && depth0.twoDec),options={hash:{},data:data},helper ? helper.call(depth0, (depth0 && depth0.avg_num_followers), options) : helperMissing.call(depth0, "twoDec", (depth0 && depth0.avg_num_followers), options)))
    + "</strong></h2>\n        </div>\n      </div>\n    </div>\n  </div>\n  <h4 class=\"sub-header\">Exceptional Twitter Profiles</h4>\n  <div class=\"row\">\n    <div class=\"col-sm-4\">\n\n      <div class=\"block\">\n        <div class=\"block-title text-center themed-background-twitter\">\n          <h3 style=\"color:white;\"><strong>Largest Number of Followers</strong></h3>\n        </div>\n        <div class=\"widget-extra-full text-center\">\n          <h2><strong>"
    + escapeExpression((helper = helpers.formatNum || (depth0 && depth0.formatNum),options={hash:{},data:data},helper ? helper.call(depth0, (depth0 && depth0.max_followers), options) : helperMissing.call(depth0, "formatNum", (depth0 && depth0.max_followers), options)))
    + "</strong></h2>\n        </div>\n      </div>\n    </div>\n    <div class=\"col-sm-4\">\n\n      <div class=\"block\">\n        <div class=\"block-title text-center themed-background-twitter\">\n          <h3 style=\"color:white;\"><strong>Max Public Lists a Single User is on</strong></h3>\n        </div>\n        <div class=\"widget-extra-full text-center\">\n          <h2><strong>"
    + escapeExpression((helper = helpers.formatNum || (depth0 && depth0.formatNum),options={hash:{},data:data},helper ? helper.call(depth0, (depth0 && depth0.max_lists), options) : helperMissing.call(depth0, "formatNum", (depth0 && depth0.max_lists), options)))
    + "</strong></h2>\n        </div>\n      </div>\n    </div>\n    <div class=\"col-sm-4\">\n\n      <div class=\"block\">\n        <div class=\"block-title text-center themed-background-twitter\">\n          <h3 style=\"color:white;\"><strong>Users with Verified Profiles<br></strong></h3>\n        </div>\n        <div class=\"widget-extra-full text-center\">\n          <h2><strong>"
    + escapeExpression((helper = helpers.formatNum || (depth0 && depth0.formatNum),options={hash:{},data:data},helper ? helper.call(depth0, (depth0 && depth0.total_verified_users), options) : helperMissing.call(depth0, "formatNum", (depth0 && depth0.total_verified_users), options)))
    + "</strong></h2>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>\n<div class=\"row\">\n  <div class=\"col-md-4\">\n    <div class=\"widget\">\n      <div class=\"widget-advanced\">\n        <div class=\"widget-header text-center themed-background-twitter\">\n          <h3 class=\"widget-content-light\">\n            Most Followers<br>\n            <small>Users with the Most Followers</small>\n          </h3>\n        </div>\n        <div class=\"widget-main\">\n          <a href=\"#\" class=\"widget-image-container animation-bigEntrance\">\n            <span class=\"widget-icon themed-background-twitter\"><i class=\"gi gi-group\"></i></span>\n          </a>\n          <div class=\"table-responsive\">\n            <table id=\"most_followed_table\" class=\"table table-striped table-vcenter table-condensed table-hover\">\n              <thead>\n                <tr>\n                  <th class=\"text-center\">Rank</th>\n                  <th class=\"text-center\"><i class=\"si si-twitter\"></i></th>\n                  <th class=\"text-center\">Followers</th>\n                </tr>\n              </thead>\n              <tbody>\n                ";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.most_followers_chart), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n              </tbody>\n            </table>\n          </div>\n          <div class=\"text-center\"><a href=\"#\" id=\"twitter_profiles_menu\" class='js-navigate-twitter-profile'>Show all..</a></div>\n        </div>\n      </div>\n    </div>\n  </div>\n  <div class=\"col-md-4\">\n    <div class=\"widget\">\n      <div class=\"widget-advanced\">\n        <div class=\"widget-header text-center themed-background-twitter\">\n          <h3 class=\"widget-content-light\">\n            Most Listed<br>\n            <small>Users on the Most Public Lists</small>\n          </h3>\n        </div>\n        <div class=\"widget-main\">\n          <a href=\"#\" class=\"widget-image-container animation-bigEntrance\">\n            <span class=\"widget-icon themed-background-twitter\"><i class=\"gi gi-list\"></i></span>\n          </a>\n          <div class=\"table-responsive\">\n            <table id=\"most_listed_table\" class=\"table table-striped table-vcenter table-condensed table-hover\">\n              <thead>\n                <tr>\n                  <th class=\"text-center\">Rank</th>\n                  <th class=\"text-center\"><i class=\"si si-twitter\"></i></th>\n                  <th class=\"text-center\">Lists</th>\n                </tr>\n              </thead>\n              <tbody>\n                ";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.most_lists_chart), {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n              </tbody>\n            </table>\n          </div>\n          <div class=\"text-center\"><a href=\"#\" id=\"twitter_profiles_menu\" class='js-navigate-twitter-profile'>Show all..</a></div>\n        </div>\n      </div>\n    </div>\n  </div>\n  <div class=\"col-md-4\">\n    <div class=\"widget\">\n      <div class=\"widget-advanced\">\n        <div class=\"widget-header text-center themed-background-twitter\">\n          <h3 class=\"widget-content-light\">\n            Most Active<br>\n            <small>Top Lifetime Tweets Among Users</small>\n          </h3>\n        </div>\n        <div class=\"widget-main\">\n          <a href=\"javascript:void(0)\" class=\"widget-image-container animation-bigEntrance\">\n            <span class=\"widget-icon themed-background-twitter\"><i class=\"gi gi-electricity\"></i></span>\n          </a>\n          <div class=\"table-responsive\">\n            <table id=\"most_active_table\" class=\"table table-striped table-vcenter table-condensed table-hover\">\n              <thead>\n                <tr>\n                  <th class=\"text-center\">Rank</th>\n                  <th class=\"text-center\"><i class=\"si si-twitter\"></i></th>\n                  <th class=\"text-center\">Tweets</th>\n                </tr>\n              </thead>\n              <tbody>\n                ";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.most_active_chart), {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n              </tbody>\n            </table>\n          </div>\n          <div class=\"text-center\"><a href=\"#\" id=\"twitter_profiles_menu\" class='js-navigate-twitter-profile'>Show all..</a></div>\n        </div>\n      </div>\n    </div>\n  </div>\n</div>";
  return buffer;
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/twitter/overview/layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id=\"twitter_overview\" style=\"\">\n  <div class=\"content-header\">\n    <div class=\"header-section\">\n      <h1><i class=\"fa fa-twitter\"></i>Twitter<br><small>An Overview of Your Twitter Profiles</small></h1>\n    </div>\n  </div>\n  <div class='chart-container'></div>\n</div>";
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/twitter/profiles/charts.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this, blockHelperMissing=helpers.blockHelperMissing;

function program1(depth0,data) {
  
  var buffer = "", stack1, helper, options;
  buffer += "\n          <tr class=";
  if (helper = helpers.setClass) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.setClass); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + ">\n          <td>";
  options={hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data}
  if (helper = helpers.verifiedIcon) { stack1 = helper.call(depth0, options); }
  else { helper = (depth0 && depth0.verifiedIcon); stack1 = typeof helper === functionType ? helper.call(depth0, options) : helper; }
  if (!helpers.verifiedIcon) { stack1 = blockHelperMissing.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(2, program2, data),data:data}); }
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n              ";
  options={hash:{},inverse:self.noop,fn:self.program(4, program4, data),data:data}
  if (helper = helpers.contributorsIcon) { stack1 = helper.call(depth0, options); }
  else { helper = (depth0 && depth0.contributorsIcon); stack1 = typeof helper === functionType ? helper.call(depth0, options) : helper; }
  if (!helpers.contributorsIcon) { stack1 = blockHelperMissing.call(depth0, stack1, {hash:{},inverse:self.noop,fn:self.program(4, program4, data),data:data}); }
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n            <a href=\""
    + escapeExpression(((stack1 = (depth0 && depth0.url)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "\" target=\"_blank\">"
    + escapeExpression(((stack1 = (depth0 && depth0.name)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</a></td>\n            <td>"
    + escapeExpression(((stack1 = (depth0 && depth0.url)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</td>\n            <td>"
    + escapeExpression(((stack1 = (depth0 && depth0.description)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</td>\n            <td class=\"text-center\">"
    + escapeExpression(((stack1 = (depth0 && depth0.created_year)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</td>\n            <td class=\"text-center\">"
    + escapeExpression(((stack1 = (depth0 && depth0.followers_count)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</td>\n            <td class=\"text-center\">"
    + escapeExpression(((stack1 = (depth0 && depth0.friends_count)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</td>\n            <td class=\"text-center\">";
  if (helper = helpers.ratio) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.ratio); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</td>\n            <td class=\"text-center\">"
    + escapeExpression(((stack1 = (depth0 && depth0.statuses_count)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</td>\n            <td class=\"text-center\">"
    + escapeExpression(((stack1 = (depth0 && depth0.listed_count)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1))
    + "</td>\n          </tr>\n          ";
  return buffer;
  }
function program2(depth0,data) {
  
  
  return "<i class=\"fa fa-check-circle\"></i>";
  }

function program4(depth0,data) {
  
  
  return "<i class=\"fa fa-exclamation-circle\"></i>";
  }

  buffer += "    <div class=\"block-title\">\n      <h2>Profile Directory</h2>\n    </div>\n    <strong>\n    <div class=\"table-responsive\">\n      <table id=\"customers_table\" class=\"table table-vcenter table-condensed table-bordered\" > <!--class=\"display\" cellspacing=\"0\" width=\"100%\">-->\n        <thead>\n          <tr>\n            <th class=\"text-center\"><i class=\"gi gi-user\"></i></th>\n            <th>Profile URL</th>\n            <th class=\"text-center\">Description</th>\n            <th class=\"text-center\">Year Joined</th>\n            <th class=\"text-center\">Twitter Followers</th>\n            <th class=\"text-center\">Following</th>\n            <th class=\"text-center\">Ratio</th>\n            <th class=\"text-center\">Tweets</th>\n            <th class=\"text-center\">Lists</th>\n          </tr>\n        </thead>\n        <tfoot>\n          <tr>\n            <th class=\"text-center\"><i class=\"gi gi-user\"></i></th>\n            <th>Profile URL</th>\n            <th class=\"text-center\">Description</th>\n            <th class=\"text-center\">Year Joined</th>\n            <th class=\"text-center\">Twitter Followers</th>\n            <th class=\"text-center\">Following</th>\n            <th class=\"text-center\">Ratio</th>\n            <th class=\"text-center\">Tweets</th>\n            <th class=\"text-center\">Lists</th>\n          </tr>\n        </tfoot>\n        <tbody>\n          ";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.twitter_stats), {hash:{},inverse:self.noop,fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n        </tbody>\n      </table>\n    </div>\n    </strong>";
  return buffer;
  });

this["JST"]["./scripts/app/templates/dashboard/sub_views/twitter/profiles/layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id=\"twitter_profiles\" style=\"\">\n  <div class=\"content-header\">\n    <div class=\"header-section\">\n      <h1>\n        <i class=\"fa fa-users\"></i>Twitter Profiles<br><small>Directory of Twitter Users Active in the Last 6 Months</small>\n      </h1>\n    </div>\n  </div>\n  <div class=\"block chart-container\"></div>\n</div>";
  });

this["JST"]["./scripts/app/templates/loading/between_loader.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div class=\"row\" >\n  <div class=\"col-md-12\">\n    <td class=\"text-center\" id='loader-icon'>\n    	<i class='fa fa-spinner fa-4x fa-spin'></i>\n			<p class='build'>Fetching data to build chart...</p>\n			<p class='render' style='display:none'>Compiling chart...</p>\n			<p class='sorry' style='display:none'>We're almost done...</p>\n    </td>\n  </div>\n</div>";
  });

this["JST"]["./scripts/app/templates/loading/intro_load.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id=\"page-content\">\n  <div id=\"spinner\">\n    <div class=\"content-header\">\n      <div class=\"header-section\">\n        <h1><i class=\"fa fa-dashboard\"></i>Your Data is Loading<br><small> Please do not refresh or reload the page.</small></h1>\n      </div>\n    </div>\n    <div class=\"row\">\n      <div class=\"col-md-12\">\n        <td class=\"text-center\"><i class=\"fa fa-spinner fa-4x fa-spin\"></i></td>\n      </div>\n    </div>\n  </div>\n</div>\n";
  });

this["JST"]["./scripts/app/templates/persistent/footer/footer.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<footer class=\"clearfix\">\n  <div class=\"pull-left\">\n    <span id=\"year-copy\">2014</span> &copy; Windsor View Corporation\n  </div>\n</footer>";
  });

this["JST"]["./scripts/app/templates/persistent/sidebar/layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id=\"sidebar\">\n  <div class=\"sidebar-scroll\">\n    <div class=\"sidebar-content\">\n      <a href=\"#\" class=\"sidebar-brand\" id=\"dash_menu\">\n        <i class=\"fa fa-globe\"></i><strong>Windsor </strong>View\n      </a>\n\n      <div id=\"client_logo\" class=\"sidebar-section\">\n      </div>\n\n      <ul class=\"sidebar-nav\">\n        <li class=\"sidebar-header\">\n          <span class=\"sidebar-header-title\">Menu</span>\n        </li>\n        <li>\n          <a href=\"#\" id=\"dash_menu\" title=\"Click for the dashboard\" class=\"active\"><i class=\"fa fa-dashboard sidebar-nav-icon\"></i>Dashboard</a>\n        </li>\n        <li>\n          <a href=\"#\" id='twitter_parent' class=\"sidebar-nav-menu\"><i class=\"fa fa-angle-left sidebar-nav-indicator\"></i><i class=\"fa fa-twitter sidebar-nav-icon\"></i>Twitter Data\n          </a>\n          <ul id=\"twitter_data_menu\" style=\"display:none;\">\n            <li><a href=\"#\" id=\"twitter_overview_menu\" title=\"Click for overview\">Overview</a></li>\n            <li><a href=\"#\" id=\"twitter_profiles_menu\" title=\"Click for profiles\"></i>Profiles</a></li>\n            <li><a href=\"#\" id='twitter_analysis_menu'>Feed Analysis</a></li>\n          </ul>\n        </li>\n        <li><a href=\"#\" id=\"geog_menu\" title=\"Click for geographic data\"><i class=\"fa fa-compass sidebar-nav-icon\"></i>Geographic Data</a></li>\n        <!-- <li><a href=\"#\" id=\"demo_menu\" title=\"Click for demographic data\" ><i class=\"gi gi-share_alt sidebar-nav-icon\"></i>Demographic Data</a></li> -->\n        <li><a href=\"#\" id=\"prof_menu\" title=\"Click for professional information\" ><i class=\"gi gi-suitcase sidebar-nav-icon\"></i>Professional Data</a></li>\n<!--         <li class=\"sidebar-header\">\n          <span class=\"sidebar-header-title\">Coming Soon</span>\n        </li>\n        <li><a href=\"#\"><i class=\"fa fa-twitter sidebar-nav-icon\"></i>Trending Topics</a></li>\n        <li><a href=\"#\"><i class=\"fa fa-money sidebar-nav-icon\"></i>Trending Brands</a></li>\n        <li><a href=\"#\"><i class=\"fa fa-facebook-square sidebar-nav-icon\"></i>Facebook Data</a></li>\n        <li><a href=\"#\"><i class=\"fa fa-tumblr sidebar-nav-icon\"></i>Blog Data</a></li>-->\n\n      </ul>\n    </div>\n  </div>\n</div>";
  });

this["JST"]["./scripts/app/templates/shared/loading.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<div id='loader'></div>";
  });

this["JST"]["./scripts/app/templates/unauthenticated/index_layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "	<header id=\"head\">\n		<div class=\"inner\">\n			<a href=\"#\" class=\"logotext square\"><h1>Windsor View</h1></a>\n			<a href=\"#\" style=\"float:right; margin-right:50px; text-decoration: none;\" class=\"contact\"><button id='login'><h1>Log In</h1></button></a>\n			<div class=\"details right\">\n				<div class=\"message\" style=\"margin-left:300px;\">\n					<p class=\"medium\">Rethinking how companies utilize social data.</p>\n					<p class=\"small\">Welcome to Windsor View.  We're focused on helping companies better leverage social data to find, understand, and reach customers.  If you are interested in learning more about our private beta, please join our email list.</p>\n				</div>\n				<link href=\"https://cdn-images.mailchimp.com/embedcode/slim-081711.css\" rel=\"stylesheet\" type=\"text/css\">\n				<form style=\"margin-left:00px;\" action=\"http://windsorview.us8.list-manage1.com/subscribe/post?u=98db67ca3f6f8c83e06b16483&amp;id=f1f51a2f5c\" method=\"post\" id=\"mc-embedded-subscribe-form\" name=\"mc-embedded-subscribe-form\" class=\"newsletter validate\" target=\"_blank\" novalidate>\n					<input type=\"email\" value=\"\" name=\"EMAIL\" class=\"email\" id=\"mce-EMAIL\" placeholder=\"Enter your email...\" required>\n					<button>Sign Up</button>\n					<div style=\"position: absolute; left: -5000px;\"><input type=\"text\" name=\"b_98db67ca3f6f8c83e06b16483_f1f51a2f5c\" tabindex=\"-1\" value=\"\"></div>\n				</form>\n			</div>\n		</div>\n	</header>\n\n	<section class=\"body\">\n		<div class=\"inner\">\n			<div class=\"copyright\">\n				<p>&copy; 2014 Windsor View Corporation</p>\n				<p>All Rights Reserved.</p>\n			</div>\n		</div>\n	</section>\n";
  });

this["JST"]["./scripts/app/templates/unauthenticated/login_layout.html"] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  


  return "<!-- Login Background -->\n<div id=\"login-background\">\n    <!-- For best results use an image with a resolution of 2560x400 pixels (prefer a blurred image for smaller file size) -->\n    <img src=\"assets/img/placeholders/backgrounds/dc_background_top.jpg\" alt=\"Login Background\">\n</div><!-- END Login Background -->\n\n<!-- Login Container -->\n<div id=\"login-container\">\n    <!-- Login Title -->\n    <div class=\"login-title text-center\">\n        <h1><i class=\"fa fa-globe\"></i> <strong>Windsor View</strong><br><small>Please <strong>Login</strong></small></h1>\n    </div>\n    <!-- END Login Title -->\n\n    <!-- Login Block -->\n    <div class=\"block push-bit\">\n        <!-- Login Form -->\n        <form action=\"javascript:login()\" id=\"form-login\" class=\"form-horizontal form-bordered form-control-borderless\">\n            <div id='error'></div>\n            <div class=\"form-group\">\n                <div class=\"col-xs-12\">\n                    <div class=\"input-group\">\n                        <span class=\"input-group-addon\"><i class=\"gi gi-envelope\"></i></span>\n                        <input type=\"text\" id=\"login-email\" name=\"login-email\" class=\"form-control input-lg\" placeholder=\"Email (lower case letters only)\">\n                    </div>\n                </div>\n            </div>\n            <div class=\"form-group\">\n                <div class=\"col-xs-12\">\n                    <div class=\"input-group\">\n                        <span class=\"input-group-addon\"><i class=\"gi gi-asterisk\"></i></span>\n                        <input type=\"password\" id=\"login-password\" name=\"login-password\" class=\"form-control input-lg\" placeholder=\"Password\">\n                    </div>\n                </div>\n            </div>\n            <div class=\"form-group form-actions\">\n                <div class=\"col-xs-4\">\n                    <label class=\"switch switch-primary\" data-toggle=\"tooltip\" title=\"Remember Me?\">\n                        <input type=\"checkbox\" id=\"login-remember-me\" name=\"login-remember-me\" checked>\n                        <span></span>\n                    </label>\n                </div>\n                <div class=\"col-xs-8 text-right\">\n                    <button type=\"submit\" class=\"btn btn-sm btn-primary\"><i class=\"fa fa-angle-right\"></i> Login to Dashboard</button>\n                </div>\n            </div>\n            <div class=\"form-group\">\n                <div class=\"col-xs-12 text-center\">\n                    <a href=\"javascript:void(0)\" id=\"link-reminder-login\"><small>Forgot password?</small></a>\n                    <!--<a href=\"javascript:void(0)\" id=\"link-register-login\"><small>Create a new account</small></a>-->\n                </div>\n            </div>\n        </form>\n        <!-- END Login Form -->\n\n        <!-- Reminder Form -->\n        <!--action=\"login.html#reminder\" method=\"post\"-->\n        <form action=\"javascript:passwordReset()\"  id=\"form-reminder\" class=\"form-horizontal form-bordered form-control-borderless display-none\">\n            <div class=\"form-group\">\n                <div class=\"col-xs-12\">\n                    <div class=\"input-group\">\n                        <span class=\"input-group-addon\"><i class=\"gi gi-envelope\"></i></span>\n                        <input type=\"text\" id=\"reminder-email\" name=\"reminder-email\" class=\"form-control input-lg\" placeholder=\"Email\">\n                    </div>\n                </div>\n            </div>\n            <div class=\"form-group form-actions\">\n                <div class=\"col-xs-12 text-right\">\n                    <button type=\"submit\" class=\"btn btn-sm btn-primary\"><i class=\"fa fa-angle-right\"></i> Reset Password</button>\n                </div>\n            </div>\n            <div class=\"form-group\">\n                <div class=\"col-xs-12 text-center\">\n                    <small>Did you remember your password?</small> <a href=\"javascript:void(0)\" id=\"link-reminder\"><small>Login</small></a>\n                </div>\n            </div>\n        </form>\n        <!-- END Reminder Form -->\n    </div>\n    <!-- END Login Block -->\n\n    <!-- Footer -->\n    <footer class=\"text-muted text-center\">\n        <small><span id=\"year-copy\">2014</span> &copy; Windsor View Corporation</small>\n    </footer>\n    <!-- END Footer -->\n</div>\n\n";
  });

return this["JST"];

});