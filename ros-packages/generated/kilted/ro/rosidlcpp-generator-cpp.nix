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
  version = "0.4.0-1";
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
        rev = "4837de0d850aabe1086c296182453e694cc173d2";
        hash = "sha256-oVa+EnK5KfnFGlTZEs/NmVNsFFwAfMshMGVTVWsHpfo=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in C++.";
  };
})
