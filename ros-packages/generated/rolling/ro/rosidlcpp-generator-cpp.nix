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
  version = "0.2.1-1";
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
        rev = "4cab027f8ad72dc05c6dd0228915d10d93d8d37e";
        hash = "sha256-4CQDaLVSbNSVUXPRvhagwG4HKCYA6A1aR7HvvFqPZAQ=";
      };
    };
  });
  meta = {
    description = "Generate the ROS interfaces in C++.";
  };
})
