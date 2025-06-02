{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-generator-type-description,
  rosidl-typesupport-interface,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_generator_cpp";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_generator_cpp";
  propagatedNativeBuildInputs = [ ament-cmake-core rcutils rosidl-cmake rosidl-generator-type-description rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  propagatedBuildInputs = [ ament-cmake-core rcutils rosidl-cmake rosidl-generator-type-description rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_generator_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_generator_cpp-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "4f54de60de13c2d2a0f94fb0f37fc09b41473eb8";
        hash = "sha256-S/UHVuebt0NMH5NWGA78fQyPPdNVOFrJp2vmNbs8RSY=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in C++.";
  };
})
