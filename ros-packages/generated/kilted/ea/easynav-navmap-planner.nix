{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  navmap-core,
  navmap-ros,
  navmap-ros-interfaces,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_navmap_planner";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_navmap_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core nav-msgs navmap-core navmap-ros navmap-ros-interfaces pluginlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core nav-msgs navmap-core navmap-ros navmap-ros-interfaces pluginlib ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_navmap_planner" = substituteSource {
      src = fetchgit {
        name = "easynav_navmap_planner-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "b4ab69d808823600862789ca915f479474dd5345";
        hash = "sha256-+AQ8SvEGypDjG4+IXCH1VZs5IsevIIk8o2cpUXACUVk=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: navmap planner package.";
  };
})
