{
  ament-cmake,
  ament-cmake-pytest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  husarion-components-description,
  joint-state-publisher,
  launch,
  launch-ros,
  mkSourceSet,
  open-manipulator-description,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_description";
  version = "0.18.6-1";
  src = finalAttrs.passthru.sources."rosbot_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ husarion-components-description joint-state-publisher launch launch-ros open-manipulator-description robot-state-publisher rviz2 xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ husarion-components-description joint-state-publisher launch launch-ros open-manipulator-description robot-state-publisher rviz2 xacro ];
  checkInputs = [ ament-cmake-pytest xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbot_description" = substituteSource {
      src = fetchgit {
        name = "rosbot_description-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "89cd12a29ee59048aeaf1679c17187aef8d33656";
        hash = "sha256-Mvbqb2ePHKgp50hQ1ezqTd4jRLBsj9fPR9+hWo77YYE=";
      };
    };
  });
  meta = {
    description = "The rosbot_description package";
  };
})
