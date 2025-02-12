{
  ament-cmake-auto,
  ament-cmake-ros,
  autoware-cmake,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."autoware_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rclcpp unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" ]; };
  checkInputs = [ ament-cmake-ros ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_utils-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "2e391696f0073bf87109a01b9fd4e3d43f0a280c";
        hash = "sha256-64bVDZx6Rh0NjYj7GrBjcZrD9RGeONzy0Gzq5qQ+1XU=";
      };
    };
  });
  meta = {
    description = "The autoware_utils package";
  };
})
