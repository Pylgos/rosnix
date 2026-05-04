{
  ament-cmake,
  ament-cmake-core,
  ament-cmake-ros-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  ros-environment,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-generator-type-description,
  rosidl-typesupport-interface,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_generator_c";
  version = "0.5.0-2";
  src = finalAttrs.passthru.sources."rosidlcpp_generator_c";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake-core rcutils ros-environment rosidl-cmake rosidl-generator-type-description rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake-core rcutils ros-environment rosidl-cmake rosidl-generator-type-description rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_generator_c" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_generator_c-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "182a836a2e08d99787583ede9763e7e75c86ebbf";
        hash = "sha256-yeTqXI23v5uX3M4ag+++0UuxMi/Iwy+G1cio/qWj/+k=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in C.";
  };
})
