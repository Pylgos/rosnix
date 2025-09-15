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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_generator_py";
  propagatedNativeBuildInputs = [ ament-cmake ament-index-python python-cmake-module rmw rosidl-generator-c rosidl-pycommon rosidl-runtime-c rosidl-typesupport-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  propagatedBuildInputs = [ ament-cmake ament-index-python python-cmake-module rmw rosidl-generator-c rosidl-pycommon rosidl-runtime-c rosidl-typesupport-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_generator_py" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_generator_py-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "efd74b76d21c04425c216fba070f5b7040a4e850";
        hash = "sha256-0ZlCkqJRcm6UxbvOF0RpTjdUuIkN7CMOqUHNx+wJZuY=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in Python.";
  };
})
