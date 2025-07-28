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
  version = "0.3.0-1";
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
        rev = "58c17b68c61565714ac899b8b67576ce2b400344";
        hash = "sha256-0iil4pPzCMa+UiE/53RV7MWmQFGMqE16blwSWYvm2iQ=";
      };
    };
  });
  meta = {
    description = "Generate hashes and descriptions of ROS 2 interface types, per REP-2011.";
  };
})
