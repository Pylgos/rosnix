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
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."nav2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geographic-msgs geometry-msgs nav2-common nav-msgs rclcpp std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_msgs" = substituteSource {
      src = fetchgit {
        name = "nav2_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "57fac26dcfb7b33c6ee1e15123dfafb1d7ee48e7";
        hash = "sha256-0Rumm6Kqx+8neXAzndXzMfsEjAj/VPINvAPujIBzNiM=";
      };
    };
  });
  meta = {
    description = "Messages and service files for the Nav2 stack";
  };
})
