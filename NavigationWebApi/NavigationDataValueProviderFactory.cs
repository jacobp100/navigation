﻿using System.Web.Http.Controllers;
using System.Web.Http.ValueProviders;

namespace Navigation.WebApi
{
	/// <summary>
	/// Represents a factory for creating <see cref="NavigationData"/> value provider objects
	/// </summary>
	public class NavigationDataValueProviderFactory : ValueProviderFactory
	{
		/// <summary>
		/// Returns a <see cref="NavigationData"/> value provider for the specified action context
		/// </summary>
		/// <param name="actionContext">The context within which the result is executed</param>
		/// <returns><see cref="NavigationData"/> value provider</returns>
		public override IValueProvider GetValueProvider(HttpActionContext actionContext)
		{
			return new NavigationDataValueProvider();
		}
	}
}
