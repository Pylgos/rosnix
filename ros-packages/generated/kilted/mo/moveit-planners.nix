{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-planners-chomp,
  moveit-planners-ompl,
  moveit-planners-stomp,
  pilz-industrial-motion-planner,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_planners";
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_planners";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-planners-chomp moveit-planners-ompl moveit-planners-stomp pilz-industrial-motion-planner ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-planners-chomp moveit-planners-ompl moveit-planners-stomp pilz-industrial-motion-planner ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_planners" = substituteSource {
      src = fetchgit {
        name = "moveit_planners-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "3840f1dc42b4a8b5bbc63f362f3874429b0f4d33";
        hash = "sha256-AWByFzX2mMWhy2sB0cMwdroTtz8UKCw7MbIVkLtwGMY=";
      };
    };
  });
  meta = {
    description = "Meta package that installs all available planners for MoveIt";
  };
})
