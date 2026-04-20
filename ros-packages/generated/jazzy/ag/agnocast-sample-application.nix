{
  agnocast-components,
  agnocast-sample-interfaces,
  agnocastlib,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "agnocast_sample_application";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."agnocast_sample_application";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ agnocast-components agnocast-sample-interfaces agnocastlib rclcpp rclcpp-components ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ agnocast-components agnocast-sample-interfaces agnocastlib rclcpp rclcpp-components ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast_sample_application" = substituteSource {
      src = fetchgit {
        name = "agnocast_sample_application-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "d320a97125310e5692e87f04cbe0e15fddc0087b";
        hash = "sha256-2wYN+AvJcCHjXmXTfSww2tOVa+mtiZGnXnSnrXLj3L8=";
      };
    };
  });
  meta = {
    description = "\n    A sample application for Agnocast.\n  ";
  };
})
