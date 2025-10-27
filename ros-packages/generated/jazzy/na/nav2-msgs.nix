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
  version = "1.3.10-1";
  src = finalAttrs.passthru.sources."nav2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geographic-msgs geometry-msgs nav2-common nav-msgs rclcpp rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geographic-msgs geometry-msgs nav2-common nav-msgs rclcpp rosidl-default-generators std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_msgs" = substituteSource {
      src = fetchgit {
        name = "nav2_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "70217f3a43f625ed64e7abbaa97a2e4c33d64617";
        hash = "sha256-M/xYEa1LViRjnW0Hz0uPLMuC0IS8H/ZC0/YBwzECEfE=";
      };
    };
  });
  meta = {
    description = "Messages and service files for the Nav2 stack";
  };
})
