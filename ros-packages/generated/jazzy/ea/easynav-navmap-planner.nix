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
  version = "0.2.1-2";
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
        rev = "bc95386361fa1508764e8c91d72fed574729a62d";
        hash = "sha256-XEhPwrqLLU1wg84ZINRocMTK3JN7NpT5/jgUcZjs/W4=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: navmap planner package.";
  };
})
