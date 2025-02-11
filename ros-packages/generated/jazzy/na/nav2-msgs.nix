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
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geographic-msgs geometry-msgs nav2-common nav-msgs rclcpp std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_msgs" = substituteSource {
      src = fetchgit {
        name = "nav2_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "b892fcb910e72b994f084cecbee16f70c1076bb2";
        hash = "sha256-b8xN3OQ+nmxdmc+ZJtJ4XvTkEzby0a9COI+UZIYLQEU=";
      };
    };
  });
  meta = {
    description = "Messages and service files for the Nav2 stack";
  };
})
