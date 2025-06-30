{
  ament-cmake,
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
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_generator_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core rcutils rosidl-cmake rosidl-generator-type-description rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core rcutils rosidl-cmake rosidl-generator-type-description rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_generator_cpp" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_generator_cpp-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "eccef21db4b972cd8bf72a4e20d9a5612d5fe8bd";
        hash = "sha256-ODKpz1Pp/JFLqCMXz4/SJ4X0Qb/TumLrmtq14tPEDzw=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in C++.";
  };
})
