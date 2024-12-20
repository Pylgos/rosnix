{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-core,
  moveit-planners,
  moveit-plugins,
  moveit-ros,
  moveit-setup-assistant,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit";
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-core moveit-planners moveit-plugins moveit-ros moveit-setup-assistant ];
  passthru.sources = mkSourceSet (sources: {
    "moveit" = substituteSource {
      src = fetchgit {
        name = "moveit-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "9ddecca681cd446130a470f163f3fdba1ac75111";
        hash = "sha256-NHTvM+vpN/RUAYVXlun/epxyx0njiqzhwiux74uGTy4=";
      };
    };
  });
  meta = {
    description = "Meta package that contains all essential packages of MoveIt 2";
  };
})
