{
  ament-cmake-auto,
  ament-cmake-ros,
  autoware-cmake,
  autoware-lanelet2-extension,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lanelet2-core,
  lanelet2-io,
  lanelet2-projection,
  lanelet2-python,
  lanelet2-routing,
  lanelet2-traffic-rules,
  lanelet2-validation,
  mkSourceSet,
  python-cmake-module,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_lanelet2_extension_python";
  version = "0.7.0-1";
  src = finalAttrs.passthru.sources."autoware_lanelet2_extension_python";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake python-cmake-module ];
  propagatedBuildInputs = [ autoware-lanelet2-extension geometry-msgs lanelet2-core lanelet2-io lanelet2-projection lanelet2-python lanelet2-routing lanelet2-traffic-rules lanelet2-validation rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-python-dev" ]; };
  checkInputs = [ ament-cmake-ros ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_lanelet2_extension_python" = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_extension_python-source";
        url = "https://github.com/ros2-gbp/autoware_lanelet2_extension-release.git";
        rev = "8a1acf1d3b4dffe2a101726d7caa73317ec73c0d";
        hash = "sha256-8rHXcQuoRttN0/lnhBCDu+o7rzcs/rgAfHmJZxpRuXc=";
      };
    };
  });
  meta = {
    description = "The autoware_lanelet2_extension_python package contains Python bindings for lanelet2_extension package";
  };
})
