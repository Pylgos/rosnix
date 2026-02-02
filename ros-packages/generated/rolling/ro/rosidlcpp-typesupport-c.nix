{
  ament-cmake-core,
  ament-cmake-ros-core,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  ros-environment,
  rosSystemPackages,
  rosidl-cli,
  rosidl-generator-c,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-typesupport-interface,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_typesupport_c";
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_typesupport_c";
  nativeBuildInputs = [ ament-cmake-ros-core ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils ros-environment rosidl-cli rosidl-generator-c rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake-ros-core ];
  propagatedBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils ros-environment rosidl-cli rosidl-generator-c rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_typesupport_c" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_typesupport_c-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "eebeb56da38405b7ed7b3d72958fc9d941051915";
        hash = "sha256-1y3NprEWwj2nWnemJDG7yFSEMgWycgcBHZ+SFctWNjY=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C messages.";
  };
})
