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
  version = "0.4.0-1";
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
        rev = "5a92224e5db7f6ef3f071eb450abf53689b9276d";
        hash = "sha256-CAvazTgLznPsXEWcSjhq8VqHSFr5q0ODvke3/+mbN4E=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C messages.";
  };
})
