{
  ament-cmake,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-cmake-module,
  rmw,
  rosSystemPackages,
  rosidl-generator-c,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-typesupport-c,
  rosidl-typesupport-interface,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_generator_py";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_generator_py";
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python python-cmake-module rmw rosidl-generator-c rosidl-pycommon rosidl-runtime-c rosidl-typesupport-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  propagatedBuildInputs = [ ament-cmake ament-index-python python-cmake-module rmw rosidl-generator-c rosidl-pycommon rosidl-runtime-c rosidl-typesupport-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_generator_py" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_generator_py-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "f64b7b2ed92cae01cc0b8adc9807850213214627";
        hash = "sha256-gBSBco6IadVkxJJNkkVp7xHbSJH4XLmkN+PJ1cnEvWE=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in Python.";
  };
})
