{
  ament-cmake,
  buildAmentCmakePackage,
  easynav-common,
  easynav-controller,
  easynav-core,
  easynav-interfaces,
  easynav-localizer,
  easynav-maps-manager,
  easynav-planner,
  easynav-sensors,
  easynav-support-py,
  easynav-system,
  easynav-tools,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."easynav";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-controller easynav-core easynav-interfaces easynav-localizer easynav-maps-manager easynav-planner easynav-sensors easynav-support-py easynav-system easynav-tools ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-controller easynav-core easynav-interfaces easynav-localizer easynav-maps-manager easynav-planner easynav-sensors easynav-support-py easynav-system easynav-tools ];
  passthru.sources = mkSourceSet (sources: {
    "easynav" = substituteSource {
      src = fetchgit {
        name = "easynav-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "0d65021893f2629b3a15d6151a29d3a8bfca1cfe";
        hash = "sha256-NArna5lpJYYzhALy0xAyiVHU3EO6SkxD5UFHL/UzgYo=";
      };
    };
  });
  meta = {
    description = "Easy Navigation:Mata package for installing all EasyNav.";
  };
})
