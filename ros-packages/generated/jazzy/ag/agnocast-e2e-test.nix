{
  agnocast-components,
  agnocastlib,
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "agnocast_e2e_test";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."agnocast_e2e_test";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ agnocast-components agnocastlib rclcpp rclcpp-components std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ agnocast-components agnocastlib rclcpp rclcpp-components std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast_e2e_test" = substituteSource {
      src = fetchgit {
        name = "agnocast_e2e_test-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "ff61ede77712e8f1af509cfb3ed5de465958afb9";
        hash = "sha256-pjL//uaDb8OnbGhR3OtcO9O/1p6qrUUUxqZfc86fHY0=";
      };
    };
  });
  meta = {
    description = "\n    E2E test for Agnocast.\n  ";
  };
})
