{
  action-msgs,
  ament-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_msgs";
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geographic-msgs geometry-msgs nav2-common nav-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_msgs" = substituteSource {
      src = fetchgit {
        name = "nav2_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "1b5257d79a21b346727657786aba208b916413f8";
        hash = "sha256-BxgAUrDFsMldlk61uXCx4+a+XiV5KpcJIbGdoYSqlLM=";
      };
    };
  });
  meta = {
    description = "Messages and service files for the Nav2 stack";
  };
})
