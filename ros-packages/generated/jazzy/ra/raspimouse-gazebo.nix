{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  mkSourceSet,
  raspimouse-description,
  raspimouse-fake,
  robot-state-publisher,
  ros-gz,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_gazebo";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."raspimouse_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ controller-manager diff-drive-controller joint-state-broadcaster raspimouse-description raspimouse-fake robot-state-publisher ros-gz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_gazebo" = substituteSource {
      src = fetchgit {
        name = "raspimouse_gazebo-source";
        url = "https://github.com/ros2-gbp/raspimouse_sim-release.git";
        rev = "7e3576d146ebef2e99f0604757f29988e90a8b80";
        hash = "sha256-00+xpqUcbvV0fCz6nNFJ1pUCtvCnLhhQhE0oD2bCmHM=";
      };
    };
  });
  meta = {
    description = "The raspimouse_gazebo package";
  };
})
