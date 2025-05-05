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
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."raspimouse_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ controller-manager diff-drive-controller joint-state-broadcaster raspimouse-description raspimouse-fake robot-state-publisher ros-gz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-manager diff-drive-controller joint-state-broadcaster raspimouse-description raspimouse-fake robot-state-publisher ros-gz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_gazebo" = substituteSource {
      src = fetchgit {
        name = "raspimouse_gazebo-source";
        url = "https://github.com/ros2-gbp/raspimouse_sim-release.git";
        rev = "b182887c4b3380ff818f209bc78b8168197f475a";
        hash = "sha256-AZEqsn/tMLFykPK2Sw/WPPQXVsOHb9ygnmUQdpCOAjs=";
      };
    };
  });
  meta = {
    description = "The raspimouse_gazebo package";
  };
})
