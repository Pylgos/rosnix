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
  rosidl-runtime-c,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_generator_type_description";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_generator_type_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-core rcutils rosidl-runtime-c rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-core rcutils rosidl-runtime-c rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_generator_type_description" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_generator_type_description-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "be128db3b4216161cc9e10fab208894dcdff1254";
        hash = "sha256-sxsas8vIBFXwLdSZPWth+Lnee6PQfDlzzWNMbfXh/cE=";
      };
    };
  });
  meta = {
    description = "Generate hashes and descriptions of ROS 2 interface types, per REP-2011.";
  };
})
