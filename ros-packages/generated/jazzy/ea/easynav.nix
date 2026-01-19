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
  version = "0.2.2-1";
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
        rev = "a37bb7104a5a4e3f37f53b8a4e1825140b3f7cd1";
        hash = "sha256-tdxjf3MtcnRI/0KBmXOvTUhCy0GY9oqNtW1W/Yfv1cI=";
      };
    };
  });
  meta = {
    description = "Easy Navigation:Mata package for installing all EasyNav.";
  };
})
