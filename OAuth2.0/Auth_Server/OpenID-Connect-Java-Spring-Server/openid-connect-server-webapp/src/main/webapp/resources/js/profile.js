/*******************************************************************************
 * Copyright 2018 The MIT Internet Trust Consortium
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *******************************************************************************/
ui.routes.push({
	path: "user/profile",
	name: "profile",
	callback: function() {

		this.breadCrumbView.collection.reset();
		this.breadCrumbView.collection.add([{
			text: $.t('admin.home'),
			href: ""
		}, {
			text: $.t('admin.user-profile.show'),
			href: "manage/#user/profile"
		}]);

		this.updateSidebar('user/profile');

		var view = new UserProfileView({
			model: getUserInfo()
		});
		$('#content').html(view.render().el);

		setPageTitle($.t('admin.user-profile.show'));

	}
});