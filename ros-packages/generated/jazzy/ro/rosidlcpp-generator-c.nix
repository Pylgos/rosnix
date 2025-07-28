{
  ament-cmake,
  ament-cmake-core,
  ament-cmake-ros,
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
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_generator_c";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake-core rcutils ros-environment rosidl-cmake rosidl-generator-type-description rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake-core rcutils ros-environment rosidl-cmake rosidl-generator-type-description rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_generator_c" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_generator_c-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "01be0e51106a2a99fc6ae39ad7dc9d63aa00d355";
        hash = "sha256-AvOwUkbI+Wnkd4HDYtix3/GZ6nDWSE90uQuUpQPS9rA=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in C.";
  };
})
