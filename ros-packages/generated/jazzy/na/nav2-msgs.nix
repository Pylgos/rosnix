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
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."nav2_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geographic-msgs geometry-msgs nav2-common nav-msgs rclcpp std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "nav2_msgs" = substituteSource {
        src = fetchgit {
          name = "nav2_msgs-source";
          url = "https://github.com/SteveMacenski/navigation2-release.git";
          rev = "450e6115d88d059390e9c438b2fc1f56980779a6";
          hash = "sha256-spOTXqILKMSfnSB3vCcukMwFuB5GB7aF1Hog34VzIBI=";
        };
      };
    });
  };
  meta = {
    description = "Messages and service files for the Nav2 stack";
  };
})
