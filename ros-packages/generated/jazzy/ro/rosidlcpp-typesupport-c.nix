{
  ament-cmake-core,
  ament-cmake-ros,
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
  rosidl-typesupport-introspection-c,
  rosidlcpp-generator-core,
  rosidlcpp-parser,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidlcpp_typesupport_c";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."rosidlcpp_typesupport_c";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils ros-environment rosidl-cli rosidl-generator-c rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface rosidl-typesupport-introspection-c rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils ros-environment rosidl-cli rosidl-generator-c rosidl-pycommon rosidl-runtime-c rosidl-typesupport-interface rosidl-typesupport-introspection-c rosidlcpp-generator-core rosidlcpp-parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "nlohmann-json-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosidlcpp_typesupport_c" = substituteSource {
      src = fetchgit {
        name = "rosidlcpp_typesupport_c-source";
        url = "https://github.com/ros2-gbp/rosidlcpp-release.git";
        rev = "0503db98850850735ff38c05defe1a0a07cd17b8";
        hash = "sha256-CAvazTgLznPsXEWcSjhq8VqHSFr5q0ODvke3/+mbN4E=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C messages.";
  };
})
